# Rename-ADUser
Makes Renaming Active Directory User Accounts an breeze!

EXAMPLE COMMAND : Rename-ADUser -Domain-Controller "DOMAIN_CONTROLLER" -AD-Filter {(samAccountName -eq 'USER_TO_FIND')} -New-FN 'NEW_NAME'

EXAMPLE COMPLEX COMMAND : Rename-ADUser -Domain-Controller "DOMAIN_CONTROLLER" -AD-Filter {(samAccountName -eq 'USER_TO_FIND')} -New-SAM 'NEW_SAMACCOUNTNAME' -New-PublicDisplayName 'NEW_DISPLAYNAME' -New-EmailAddr 'NEW_EMAIL_ADDRESS' -New-FN 'NEW_NAME' -New-LN 'NEW_NAME' -New-DisplayName 'NEW_DISPLAY_NAME' -New-Description 'NEW_DESCRIPTION' -New-Office 'NEW_OFFICE' -New-SMTP-Alias "SMTP:NEW_PROXY" -Old-SMTP-Alias "SMTP:OLD_PROXY
