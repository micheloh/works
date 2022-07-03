options metaserver="your.metadata.server"
        metaport=8561
		metauser="sasadm"
		metapass="sasadmpw"
		metarepository="Foundation"
		metaprotocol=BRIDGE;

data users_grps;
  length uri name group groupuri $256 id $20;
  n=1;
  uri='';
  name='';
  group='';
  groupuri='';
  id='';
     /*DETERMINE HOW MANY PERSON OBJECTS ARE DEFINED*/
  nobj=metadata_getnobj("omsobj:Person?@Id contains '.'",n,uri);
  if nobj=0 then put 'No Persons available.';

  else do while (nobj > 0);
        /***RETRIEVE THE CURRENT PERSON'S NAME***/
     rc=metadata_getattr(uri, "Name", Name);

	    /***GET THE GROUP ASSOCIATION INFORMATION FOR THE CURRENT PERSON***/
	 a=1;
	 grpassn=metadata_getnasn(uri,"IdentityGroups",a,groupuri);
	 if grpassn in (-3,-4) then do;
        group="No groups";
		output;
	 end;

	    /***IF THE PERSON BELONGS IN ANY GROUPS, LOOP THROUGH THE LIST
	        AND RETRIEVE THE NAME OF EACH GROUP***/
	 else do while (grpassn > 0);
		rc2=metadata_getattr(groupuri, "Name", group);
		a+1;
		output;
        grpassn=metadata_getnasn(uri,"IdentityGroups",a,groupuri);
     end;
	   
	   /***RETRIEVE THE NEXT PERSON'S INFORMATION***/
     n+1;
     nobj=metadata_getnobj("omsobj:Person?@Id contains '.'",n,uri);
  end;
  keep name group;
run;

data users_logins;
  length uri name userid authdomain loginuri authuri $256 id $20;
  n=1;
  uri='';
  name='';
  loginuri='';
  authuri='';
  id='';

     /*DETERMINE HOW MANY PERSON OBJECTS ARE DEFINED*/
  nobj=metadata_getnobj("omsobj:Person?@Id contains '.'",n,uri);
  if nobj=0 then put 'No Persons available.';

  else do while (nobj > 0);
        /***RETRIEVE THE CURRENT PERSON'S NAME***/
     rc=metadata_getattr(uri, "Name", Name);

	    /***GET THE LOGIN ASSOCIATION INFORMATION FOR THE CURRENT PERSON***/
	 a=1;
	 loginassn=metadata_getnasn(uri,"Logins",a,loginuri);
	 if loginassn in (-3,-4) then do;
        userid="No logins";
		authdomain="No authentication domains";
		output;
	 end;

	    /***IF THE PERSON HAS LOGINS, LOOP THROUGH THE LIST
	        AND RETRIEVE THE USERID AND AUTHENTICATION DOMAIN FOR EACH***/
	 else do while (loginassn > 0);
		rc2=metadata_getattr(loginuri, "UserId", userid);
		rc2=metadata_getnasn(loginuri, "Domain",1,authuri);
		if rc2 in (-3, -4) then authdomain="No authentication domain for this id";
		else rc2=metadata_getattr(authuri, "Name", authdomain);
		a+1;
		output;
        loginassn=metadata_getnasn(uri,"Logins",a,loginuri);
     end;
	   
	   /***RETRIEVE THE NEXT PERSON'S INFORMATION***/
     n+1;
     nobj=metadata_getnobj("omsobj:Person?@Id contains '.'",n,uri);
  end;
  keep name userid authdomain;
run;

proc sort data=users_grps; by name;
proc sort data=users_logins; by name;
data users_grps_logins;
  merge users_grps users_logins;
  by name;
run;

options linesize=120;
proc report data=users_grps_logins nowd headline headskip ls=120;
  columns name userid authdomain group;
  define name / order 'User Name' format=$30.;
  define userid / order 'UserId' format=$25.;
  define authdomain / order 'Authentication Domain' format=$25.;
  define group / order 'Group' format=$30.;
  break after name / skip;
run;

