<#
.SYNOPSIS
    Re-Names Active Directory User Account's with ease

.DESCRIPTION
    Easily Re-name Active Directory Accounts without the hassle of editing everything by hand

.PARAMETER New-FN
    Enter the users new first name (if applicable)

.PARAMETER New-LN
    Enter the users new last name (if applicable)

.PARAMETER New-EmailAddr
    Enter the users new email address (if applicable)

.PARAMETER New-SAM
    Enter the users new samAccountName (if applicable)

.PARAMETER New-DisplayName
    Enter the users new displayname (if applicable)

.PARAMETER New-UPN
    Enter the users new userPrincipalName (if applicable)

.PARAMETER New-HomeFolder
    Enter the users new homefolder name (if applicable)

.PARAMETER New-SMTP-Alias
    Enter the users new Email Alias (if applicable)

.PARAMETER Old-SMTP-Alias
    Enter the users old Email Alias (if applicable)

.PARAMETER Old-FN
    Enter the users new first name (if applicable)

.PARAMETER Old-LN
    Enter the users new last name (if applicable)

.PARAMETER Old-EmailAddr
    Enter the users old email address (if applicable)

.PARAMETER Old-SAM
    Enter the users old samAccountName (if applicable)

.PARAMETER Old-UPN
    Enter the users old userPrincipalName (if applicable)

.PARAMETER Old-HomeFolder
    Enter the name of the users olf homefolder (if applicable)

.PARAMETER Domain-Controller
    Enter the DNS name of a Domain Controller you want to use

.PARAMETER AD-Filter
    Enter the AD Filter that you wish to filter to find the user with

.NOTES
    Author : Carter Sema
    Date : 4/2/2019
    Modified : Carter Sema - 4/9/2019
#>
function Rename-ADUser {
    
       param (
        [Parameter(Mandatory = $true)]
        [string]${Domain-Controller},
        [string]${AD-Filter},
        [Parameter(Mandatory=$false)]
        [string]${New-FN},
        [string]${New-LN},
        [string]${New-EmailAddr},
        [string]${New-UPN},
        [string]${New-HomeFolder},
        [string]${New-SAM},
        [string]${New-DisplayName},
        [string]${New-PublicDisplayName},
        [string]${New-Description},
        [string]${New-Office},
        [string]${New-SMTP-Alias},
        [string]${New-Alias},
        [string]${Old-FN},
        [string]${Old-LN},
        [string]${Old-EmailAddr},
        [string]${Old-SAM},
        [string]${Old-UPN},
        [string]${Old-HomeFolder},
        [string]${Old-SMTP-Alias},
        [string]${AD-Fields}
        )
        Try {
            Import-Module ActiveDirectory -Force
            }
        Catch {
            Write-Host $_.Exception.Message -ForegroundColor "Yellow"
            }
            
        Try {

            #Rename ListName, First, Last, DisplayName, SAM, UPN, Email Address, Description, Office and ProxyAddress and Removes OldProxyAddress and adds it as a alias
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName} -and ${New-SAM} -and ${New-UPN} -and ${New-EmailAddr} -and ${New-Description} -and ${New-Office} -and ${New-SMTP-Alias} -and ${Old-SMTP-Alias}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName} -SamAccountName ${New-SAM} -UserPrincipalName ${New-UPN} -EmailAddress ${New-EmailAddr} -Description ${New-Description} -Office ${New-Office} -Add @{proxyAddresses=${New-SMTP-Alias},${Old-SMTP-Alias}.ToLower()} -Remove @{proxyAddresses=${Old-SMTP-Alias}}
                }
            Else { 

            #Rename ListName, First, Last, DisplayName, SAM, UPN, Email Address, Description, Office and ProxyAddress and Removes OldProxyAddress
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName} -and ${New-SAM} -and ${New-UPN} -and ${New-EmailAddr} -and ${New-Description} -and ${New-Office} -and ${New-SMTP-Alias}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName} -SamAccountName ${New-SAM} -UserPrincipalName ${New-UPN} -EmailAddress ${New-EmailAddr} -Description ${New-Description} -Office ${New-Office} -Add @{proxyAddresses=${New-SMTP-Alias}}
                }
            Else { 

            #Rename ListName, First, Last, DisplayName, SAM, UPN, Email Address, Description, Office
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName} -and ${New-SAM} -and ${New-UPN} -and ${New-EmailAddr} -and ${New-Description} -and ${New-Office}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName} -SamAccountName ${New-SAM} -UserPrincipalName ${New-UPN} -EmailAddress ${New-EmailAddr} -Description ${New-Description} -Office ${New-Office}
                }
            Else {
            
            #Rename ListName, First, Last, DisplayName, SAM, UPN, Email Address, Description
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName} -and ${New-SAM} -and ${New-UPN} -and ${New-EmailAddr} -and ${New-Description}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName} -SamAccountName ${New-SAM} -UserPrincipalName ${New-UPN} -EmailAddress ${New-EmailAddr} -Description ${New-Description}
                }
            Else {

            #Rename ListName, First, Last, DisplayName, SAM, UPN, Email Address
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName} -and ${New-SAM} -and ${New-UPN} -and ${New-EmailAddr}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName} -SamAccountName ${New-SAM} -UserPrincipalName ${New-UPN} -EmailAddress ${New-EmailAddr}
                }
            Else {

            #Rename ListName, First, Last, DisplayName, SAM, UPN
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName} -and ${New-SAM} -and ${New-UPN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName} -SamAccountName ${New-SAM} -UserPrincipalName ${New-UPN}
                }
            Else {

            #Rename ListName, First, last, DisplayName, SAM
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName} -and ${New-SAM}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName} -SamAccountName ${New-SAM}
                }
            Else {

            #Rename ListName, First, Last, DisplayName
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN} -and ${New-DisplayName}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName}
                }
            Else {

            #Rename ListName, First, Last
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN} -and ${New-LN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN}
                }
            Else {
            
            #Replaces Primary SMTP Address and sets Old Primary SMTP to alias
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-SMTP-Alias} -and ${Old-SMTP-Alias}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -Add @{proxyAddresses=${New-SMTP-Alias}, ${Old-SMTP-Alias}.ToLower()} -Remove @{proxyAddresses=${Old-SMTP-Alias}}
            }
            else {

            #Rename List Name, First
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-FN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName} -PassThru | Set-ADUser -GivenName ${New-FN}
                }
            Else {
            
            #Rename List Name, Last
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName} -and ${New-LN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN} -DisplayName ${New-DisplayName}
            }
            else {
            
            #Rename First and last
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-FN} -and ${New-LN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -GivenName ${New-FN} -Surname ${New-LN}
            }
            else {

            #Rename Last Name
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-LN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -Surname ${New-LN}
                }
            else {
            
            #Rename First Name
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-FN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -GivenName ${New-FN}
                }
            Else {
            
            #REname userPrincipalName
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-UPN}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -UserPrincipalName ${New-UPN}
                }
            Else {
            
            #Rename samAccountName
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-SAM}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -SamAccountName ${New-SAM}
                }
            Else {
            
            #Rename Showing DisplayName
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-PublicDisplayName}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Rename-ADObject -NewName ${New-PublicDisplayName}
                }
            Else {
            
            #Rename EmailAddress
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-EmailAddr}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -EmailAddress ${New-EmailAddr}
                }
            Else {
            
            #Rename DisplayName
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-DisplayName}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -DisplayName ${New-DisplayName}
                }
            Else {
            
            #Rename Description
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-Description}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -Description ${New-Description}
                }
            Else {
            
            #Rename Office
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-Office}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -Office ${New-Office}
                }
            Else {
            
            #Add New proxyAddress
            if (${Domain-Controller} -and ${AD-Filter} -and ${New-SMTP-Alias}) {
                $FindMyUser = Get-ADUser -Server ${Domain-Controller} -Filter ${AD-Filter} | Set-ADUser -Add @{proxyAddresses= ${New-SMTP-Alias}}
                }
            Else {
                }
              
            }
        }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
}catch {Write-Host $_.Exception.Message -ForegroundColor "Magenta" }
}
