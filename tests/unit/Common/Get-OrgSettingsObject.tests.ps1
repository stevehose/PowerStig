$script:ModuleName = $MyInvocation.MyCommand.Name -replace '\.tests',''

#region HEADER
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $PSScriptRoot) )
$modulePath = "$($script:moduleRoot)\Common\$ModuleName"
Import-Module (Join-Path -Path $moduleRoot -ChildPath 'Tests\helper.psm1') -Force
Import-Module $modulePath -Force
#endregion

[xml] $OrgSettingXml =
@"
<OrganizationalSettings version="2.9">
<OrganizationalSetting id="V-1114" value="xGuest" />
<OrganizationalSetting id="V-1115" value="xAdministrator" />
<OrganizationalSetting id="V-3472.a" value="NT5DS" />
<OrganizationalSetting id="V-4108" value="90" />
<OrganizationalSetting id="V-4113" value="300000" />
<OrganizationalSetting id="V-8322.b" value="NT5DS" />
<OrganizationalSetting id="V-26482" value="Administrators" />
<OrganizationalSetting id="V-26579" value="32768" />
<OrganizationalSetting id="V-26580" value="196608" />
<OrganizationalSetting id="V-26581" value="32768" />
</OrganizationalSettings>
"@

[hashtable] $OrgSettingHashtable =
@{
    "V-1114"   = "xGuest";
    "V-1115"   = "xAdministrator";
    "V-3472.a" = "NT5DS";
    "V-4108"   = "90";
    "V-4113"   = "300000";
    "V-8322.b" = "NT5DS";
    "V-26482"  = "Administrators";
    "V-26579"  = "32768";
    "V-26580"  = "196608";
    "V-26581"  = "32768"
}

Describe "Function Get-OrgSettingsObject" {

    It "Should be able to convert an Xml document to a OrganizationalSetting array" {
        $OrgSettingArray = Get-OrgSettingsObject -OrgSettings $OrgSettingXml

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-1114"})
        $OrgSetting.StigRuleId | Should Be "V-1114"
        $OrgSetting.Value | Should Be "xGuest"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-1115"})
        $OrgSetting.StigRuleId | Should Be "V-1115"
        $OrgSetting.Value | Should Be "xAdministrator"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-3472.a"})
        $OrgSetting.StigRuleId | Should Be "V-3472.a"
        $OrgSetting.Value | Should Be "NT5DS"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-4108"})
        $OrgSetting.StigRuleId | Should Be "V-4108"
        $OrgSetting.Value | Should Be "90"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-4113"})
        $OrgSetting.StigRuleId | Should Be "V-4113"
        $OrgSetting.Value | Should Be "300000"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-8322.b"})
        $OrgSetting.StigRuleId | Should Be "V-8322.b"
        $OrgSetting.Value | Should Be "NT5DS"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26482"})
        $OrgSetting.StigRuleId | Should Be "V-26482"
        $OrgSetting.Value | Should Be "Administrators"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26579"})
        $OrgSetting.StigRuleId | Should Be "V-26579"
        $OrgSetting.Value | Should Be "32768"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26580"})
        $OrgSetting.StigRuleId | Should Be "V-26580"
        $OrgSetting.Value | Should Be "196608"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26581"})
        $OrgSetting.StigRuleId | Should Be "V-26581"
        $OrgSetting.Value | Should Be "32768"
    }

    It "Should be able to convert a Hashtable to a OrganizationalSetting array" {
        $OrgSettingArray = Get-OrgSettingsObject -OrgSettings $OrgSettingHashtable

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-1114"})
        $OrgSetting.StigRuleId | Should Be "V-1114"
        $OrgSetting.Value | Should Be "xGuest"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-1115"})
        $OrgSetting.StigRuleId | Should Be "V-1115"
        $OrgSetting.Value | Should Be "xAdministrator"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-3472.a"})
        $OrgSetting.StigRuleId | Should Be "V-3472.a"
        $OrgSetting.Value | Should Be "NT5DS"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-4108"})
        $OrgSetting.StigRuleId | Should Be "V-4108"
        $OrgSetting.Value | Should Be "90"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-4113"})
        $OrgSetting.StigRuleId | Should Be "V-4113"
        $OrgSetting.Value | Should Be "300000"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-8322.b"})
        $OrgSetting.StigRuleId | Should Be "V-8322.b"
        $OrgSetting.Value | Should Be "NT5DS"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26482"})
        $OrgSetting.StigRuleId | Should Be "V-26482"
        $OrgSetting.Value | Should Be "Administrators"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26579"})
        $OrgSetting.StigRuleId | Should Be "V-26579"
        $OrgSetting.Value | Should Be "32768"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26580"})
        $OrgSetting.StigRuleId | Should Be "V-26580"
        $OrgSetting.Value | Should Be "196608"

        $OrgSetting = $OrgSettingArray.Where({$_.StigRuleId -eq "V-26581"})
        $OrgSetting.StigRuleId | Should Be "V-26581"
        $OrgSetting.Value | Should Be "32768"
    }
}