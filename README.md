# ADSidPicker
This program aims to get the users present in Active Directory Server and provide their details such as uuid(s). I used CoreServices in Swift to get the users information.

As I want to query an AD server, I used CSGetManagedIdentityAuthority as this is a managed directory server. If the requirement is to get information from local host CS's CSGetLocalIdentityAuthority need to be used. There is another authority reference, called CSGetDefaultIdentityAuthority, which will provide all the identities managed (union of above two). More information can be found on the official documentation.

Subsequently, I used all the classes that are applicable to a user. For groups or any other entity type there are other classes defined (again refer documentation).Methods and classes of CSIdentity are used for getting all the required information. 

The query result will contain all attributes of a user, for example uuids, posix name, email ids. We need to use appropriate method to get the infomation we want. Do take a look at the code to understand the implementation.
