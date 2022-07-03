/* Enter Metadata connection information */

options
	metaserver="<hostname>"
	metaport=8561
	metauser="sasadm@saspw"
	metapass="<password>"
	metaprotocol=BRIDGE
	metarepository=Foundation;

/* -- End edit. -- */

data work.roles;

/* Declare and initialize variables. */

length ig_uri $ 38 
type $ 13 
id $ 17 
role_name $ 100 
ace_uri 
obj_uri $ 43 
obj_name $ 100 
path $ 200 
folder_name $ 100 
partree_uri 
tree_uri $ 30
;

call missing (ig_uri,type,id,role_name,ace_uri,obj_uri,obj_name,path,folder_name,partree_uri,tree_uri);

/* Define XML Query */

obj="omsobj:IdentityGroup?@PublicType = 'Role'";

/* Count role objects in Metadata. */

role_count=metadata_resolve(obj,type,id);
put "INFO: Found " role_count "roles.";


if role_count > 0 then do n=1 to role_count;

/* If roles exist, pull role names. */

	rc=metadata_getnobj(obj,n,ig_uri);
	rc=metadata_getattr(ig_uri,"Name",role_name);

	/* Count capabilities defined. */

	ace_count=metadata_getnasn(ig_uri,"AccessControlEntries",1,ace_uri); 
	if ace_count > 0 then do m=1 to ace_count;

	/*If any capabilities are defined, get the capability name and path. */

		rc=metadata_getnasn(ig_uri,"AccessControlEntries",m,ace_uri);
		rc=metadata_getnasn(ace_uri,"Objects",1,obj_uri);
		rc=metadata_getattr(obj_uri,"Name",obj_name); /* capability name */
		rc=metadata_getnasn(obj_uri,"Trees",1,tree_uri); /* capability containing folder */
		rc=metadata_getattr(tree_uri,"Name",folder_name);
		path=catx("\",folder_name);
		parent_rc=metadata_getnasn(tree_uri,"ParentTree",1,partree_uri); /* Get parent folder. */
			do while (parent_rc > 0); /* Loop to build path from parent folder objects. */
				rc=metadata_getattr(partree_uri,"Name",folder_name);
				path=catx("\",folder_name,path);
				parent_rc=metadata_getnasn(partree_uri,"ParentTree",1,partree_uri);		
			end;
		output;
	end;
end;
keep role_name path obj_name;
/* Return only role, capability and capability context path to dataset. */
run;