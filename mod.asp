
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<link rel="stylesheet" href="http://192.168.100.1/resource/common/style.css?2019110601063818553184798" type="text/css"/>
<link rel="stylesheet"  href='http://192.168.100.1/Cuscss/english/frame.css?2019110601063818553184798' type='text/css'>
<script language="JavaScript" src="http://192.168.100.1/resource/common/util.js?2019110601063818553184798"></script>
<title>DHCP Configure</title>
<script language="JavaScript" src="http://192.168.100.1/resource/common/InitForm.asp?2019110601063818553184798"></script>
<script language="JavaScript" src='http://192.168.100.1/Cusjs/InitFormCus.js?2019110601063818553184798'></script>
<script language="JavaScript" src="http://192.168.100.1/resource/common/jquery.min.js?2019110601063818553184798"></script>
<script language="JavaScript" src="http://192.168.100.1/resource/english/bbspdes.html?2019110601063818553184798"></script>
<script language="javascript" src="http://192.168.100.1/html/bbsp/common/managemode.asp"></script>
<script language="javascript" src="http://192.168.100.1/html/bbsp/common/dhcpinfo.asp"></script>
<script language="JavaScript" src="http://192.168.100.1/html/bbsp/dhcpservercfg/dhcp2.cus?2019110601063818553184798"></script>
<style>
.TextBox
{
width:130px;  
}
.TextBox_2
{
width:63px;  
}
.TextBoxLtr
{
width:130px;
direction:ltr;  
}
.Select
{
width:135px;  
}
.Select_2
{
width:63px;
margin:0px 0px 0px 3px;
}
</style>
<script language="JavaScript" type="text/javascript">
var curUserType='1';
var normaluserenable;
var sysUserType='0';
var curCfgModeWord ='COMMON4'; 
var conditionpoolfeature ='0';
var hiderelay125feature ='0';
var norightslavefeature ='0';
var slv_independency='0';
var SonetFlag = '0';
var SonetHN8055QFlag = '0';
var option240feature = '0';
var SingtelMode = '0';
var gstwfpoolfeature ='0';
var ProductType = '1';
var gstuseallslvpool ='0';
var multioptionsfeature = '0';
var IsAPFlagfeature = '0';
var ptvdfflag = '0';
var selctIndex = -1;
var TableName = "DhcpOptions";
var IsPTVDFFlag = '0';
var IsDNSLockEnable = '0'
var isSAFARICOM = '0';
var IsNETLIFElag = '0';
var CfgMode = 'COMMON4';
var CfgWord = CfgMode.toUpperCase();

if (CfgWord == "NOS2")
{
gstwfpoolfeature = 0;
}

if((1 == gstwfpoolfeature) || ("1" == GetCfgMode().DT_HUNGARY))
{
   conditionpoolfeature = 0;
}

function MultiOption(domain,VendorClassID,X_HW_Option43)
{
this.domain       = domain;
this.VendorClassID    = VendorClassID;
this.X_HW_Option43    = X_HW_Option43;
}

var Multioptions = new Array(null);

var MOptions = new Array();
for (var i = 0; i < Multioptions.length-1; i++)
{
    MOptions[i] = Multioptions[i];
}

var MoptionArray = MOptions.slice(1);

function IsSonetUser()
{
if((SonetFlag == '1') 
&& curUserType != '0')
{
return true;
}
else
{
return false;
}
}

function IsSingtelUser()
{
if((SingtelMode == '1') 
&& curUserType != '0')
{
return true;
}
else
{
return false;
}
}


function IsSonetHN8055QUser()
{
if((SonetHN8055QFlag == '1') 
&& curUserType != '0')
{
return true;
}
else
{
return false;
}
}

function IsSonetNewNormalUser()
{
if ((('SONET' == curCfgModeWord.toUpperCase()) || ('SONET8045Q' == curCfgModeWord.toUpperCase())) && (curUserType != '0'))
{
return true;
}
else
{
return false;
}
}

function IsOSKNormalUser()
{
if (GetCfgMode().OSK == "1" && curUserType != '0')
{
return true;
}
else
{
return false;
}
}

function IsAISNormalUser()
{
if ('AIS' == CfgModeWord.toUpperCase() && curUserType != '0')
{
return true;
}
else
{
return false;
}
}

function IsBJUNICOMNormalUser()
{
if ('BJUNICOM' == CfgModeWord.toUpperCase() && curUserType != '0')
{
return true;
}
else
{
return false;
}
}

function IsDigicelNormalUser()
{
if (('DIGICEL' == CfgModeWord.toUpperCase()) || ('DIGICEL2' == CfgModeWord.toUpperCase()))
{
return true;
}
else
{
return false;
}
}

function IsTrueNormalUser()
{
if (('TRUE' == CfgModeWord.toUpperCase() ||'TRUERG' == CfgModeWord.toUpperCase()) && curUserType != '0')
{
return true;
}
else
{
return false;
}
}

var TELMEX = false;

if (GetCfgMode().TELMEX == "1")
{
TELMEX = true;
}
else
{
TELMEX = false;
}

function loadlanguage()
{
var all = document.getElementsByTagName("td");
for (var i = 0; i <all.length ; i++) 
{
var b = all[i];
if(b.getAttribute("BindText") == null)
{
continue;
}
b.innerHTML = dhcp2_language[b.getAttribute("BindText")];
}
}

function dhcpcnst(domain,dhcpStart,dhcpEnd,LeaseTime,Enable,option60,ntpsvr,Option43,NormalUserEnable,SlaDNS)
{
this.domain = domain;
this.dhcpStart = dhcpStart;
this.dhcpEnd = dhcpEnd;
this.LeaseTime = LeaseTime;
this.Enable = Enable;  
this.option60 = option60;
if(SlaDNS == "")
{
this.SlaPriDNS= "";  
this.SlaSecDNS  = "";
}
else
{
var SlaDnss = SlaDNS.split(',');
this.SlaPriDNS= SlaDnss[0];  
this.SlaSecDNS  = SlaDnss[1];

if (SlaDnss.length <=1)
{
    this.SlaSecDNS = "";
}
}

this.ntpsvr  = ntpsvr; 
this.Option43 = Option43;
this.NormalUserEnable = NormalUserEnable;
}

function dhcpcnst1(domain,dhcpStart,dhcpEnd,LeaseTime,Enable,option60,ntpsvr,NormalUserEnable,SlaDNS)
{
this.domain = domain;
this.dhcpStart = dhcpStart;
this.dhcpEnd = dhcpEnd;
this.LeaseTime = LeaseTime;
this.Enable = Enable;  
this.option60 = option60;
if(SlaDNS == "")
{
this.SlaPriDNS= "";  
this.SlaSecDNS  = "";
}
else
{
var SlaDnss = SlaDNS.split(',');
this.SlaPriDNS= SlaDnss[0];  
this.SlaSecDNS  = SlaDnss[1];

if (SlaDnss.length <=1)
{
    this.SlaSecDNS = "";
}
}

this.ntpsvr  = ntpsvr; 
this.NormalUserEnable = NormalUserEnable;
}

function condhcpst(domain,enable,option60,option60mode,ipstart,ipend,gateway,gatewaymask,dnss,dhcpleasetime,normaluserenable,option43)
{
this.Domain = domain;
this.Gateway     = gateway;
this.Gatewaymask    = gatewaymask;
this.DhcpStart = ipstart;
this.DhcpEnd = ipend;
this.LeaseTime = dhcpleasetime;
this.Enable = enable;  
this.Option60 = option60;
this.Option60mode = option60mode;
if(dnss == "")
{
this.SlaPriDNS= "";  
this.SlaSecDNS  = "";
}
else
{
var SlaDnss = dnss.split(',');
this.SlaPriDNS= SlaDnss[0];  
this.SlaSecDNS  = SlaDnss[1];

if (SlaDnss.length <=1)
{
    this.SlaSecDNS = "";
}
}

this.NormalUserEnable = normaluserenable;
this.option43 = option43;
}

function stDhcpConditionOption(domain,enable,tag,value)
{
this.domain       = domain;
this.enable           = enable;
this.tag              = tag;
this.value            = value;
this.type            = "ConditionPool"
}

function dhcpmainst(domain,enable,startip,endip,leasetime,l2relayenable,HGWstartip,HGWendip,STBstartip,STBendip,Camerastartip,Cameraendip,Computerstartip,Computerendip,Phonestartip,Phoneendip,MainDNS,X_HW_Option125Enable,DNSServers,OptionEnable)
{
this.domain = domain;
this.enable= enable;
this.startip= startip;
this.endip= endip;
this.leasetime  = leasetime;
this.l2relayenable = l2relayenable;
this.HGWstartip = HGWstartip;
this.HGWendtip = HGWendip;
this.STBstartip = STBstartip;
this.STBendtip = STBendip;
this.Camerastartip = Camerastartip;
this.Cameraendtip = Cameraendip;
this.Computerstartip = Computerstartip;
this.Computerendtip = Computerendip;
this.Phonestartip = Phonestartip;
this.Phoneendtip = Phoneendip;
MainDNS = (MainDNS == "")?DNSServers:MainDNS;
if(MainDNS == "")
{
this.MainPriDNS= "";  
this.MainSecDNS = "";
}
else
{
var MainDnss = MainDNS.split(',');
this.MainPriDNS= MainDnss[0];  
this.MainSecDNS  = MainDnss[1];
if (MainDnss.length <=1)
{
    this.MainSecDNS = "";
}
}
this.X_HW_Option125Enable = X_HW_Option125Enable;
this.OptionEnable = OptionEnable;
}

function stipaddr(domain,enable,ipaddr,subnetmask)
{
this.domain= domain;
this.enable= enable;
this.ipaddr= ipaddr;
this.subnetmask= subnetmask;
}

function stipaddrpool(startip,endip)
{
this.startip= startip;
this.endip= endip;
}

function DhcpServerInfo()
{
this.domain = null;
this.MainEnable = "";
}
var PolicyRouteNum = 0;

function PolicyRouteItem(_Domain, _Type, _VenderClassId, _WanName)
{
    this.Domain = _Domain;
    this.Type = _Type;
    this.VenderClassId = _VenderClassId;
    this.WanName = _WanName;
}

function sldcinfo(domain,startIP,endIP,enable,description)
{
    this.domain     = domain;
    this.startIP    = startIP;
    this.endIP      = endIP;    
    this.enable     = enable;
    this.description = description;
}

var PolicyRouteListAll = new Array(new PolicyRouteItem("InternetGatewayDevice.Layer3Forwarding.X_HW_policy_route.1","SourcePhyPort","","wan1\x2e1\x2eppp1"),null); 
for (i = 0; i < PolicyRouteListAll.length && PolicyRouteListAll[i]; i++)
{  
if(PolicyRouteListAll[i].Type.toUpperCase() == "SourceIP".toUpperCase())
{
PolicyRouteNum ++;
}
}

var SlaveDhcpInfos;

if (conditionpoolfeature == 1)
{
    SlaveDhcpInfos = new Array(new dhcpcnst1("InternetGatewayDevice.X_HW_DHCPSLVSERVER","192\x2e168\x2e2\x2e2","192\x2e168\x2e2\x2e254","86400","0","MSFT\x205\x2e0","","1",""),null);
}
else
{
    SlaveDhcpInfos = new Array(new dhcpcnst("InternetGatewayDevice.X_HW_DHCPSLVSERVER","192\x2e168\x2e2\x2e2","192\x2e168\x2e2\x2e254","86400","0","MSFT\x205\x2e0","","","1",""),null);  
}

var MainDhcpRange = new Array(new dhcpmainst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement","1","192\x2e168\x2e100\x2e2","192\x2e168\x2e100\x2e254","86400","1","","","","","","","","","","","200\x2e225\x2e197\x2e37\x2c200\x2e225\x2e197\x2e34","1","200\x2e225\x2e197\x2e37\x2c200\x2e225\x2e197\x2e34","0"),null);  

var LanIpInfos = new Array(new stipaddr("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1","1","192\x2e168\x2e100\x2e1","255\x2e255\x2e255\x2e0"),new stipaddr("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2","1","192\x2e168\x2e2\x2e1","255\x2e255\x2e255\x2e0"),null);
var LanHostInfo = LanIpInfos[0];
if (LanIpInfos[1] == null)
{
    LanIpInfos[1] = new stipaddr("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2", "", "", ""); 
}

var IPbr0 = LanIpInfos[0].ipaddr;
var IPbr00 = LanIpInfos[1].ipaddr;
if (IsPTVDFFlag == 1 && IPbr00 == "")
{
IPbr00 = LanIpInfos[0].ipaddr;
}
var dhcpmain = MainDhcpRange[0];

var option240 = "";
var option240instance = 0;
var ConditionDhcpInfos = new Array(null); 
if (ConditionDhcpInfos[1] == null)
{
    ConditionDhcpInfos[1] = new condhcpst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool.2", "", "", "", "", "", "", "", "", "", "",""); 
}
var DhcpConditionOptions = new Array(null);
var DhcpConditionOptionsnum = DhcpConditionOptions.length - 1;


var guestDhcpInfo = new Array(null);
var  guestwifiDhcp = new Array();
var guestflag = 0;
var guestwififlag = 0;
for (var i=0;i < guestDhcpInfo.length-1;i++)
{
    if (guestDhcpInfo[i].description =="")
    {
        guestwifiDhcp = guestDhcpInfo[i];
        guestflag = 1;
    }
    if (guestDhcpInfo[i].description == "guestwifi" && guestDhcpInfo[i].enable == 0)
    {
    guestwififlag = 1;
    }
}

if (option240feature == 1)
{
    for (var i = 0; i < DhcpConditionOptionsnum; i++)
    {
        if (DhcpConditionOptions[i].tag == "240")
    {
        option240instance = i + 1;
    var tmp  = DhcpConditionOptions[i].value;
    option240 = Base64Decode(tmp);
    }
    }
}

function setLease(dhcpLease, flag)
{
    var i = 0;
    var timeUnits = 604800;
    var infinite = ((dhcpLease == "-1") || (dhcpLease == "4294967295"));

    for(i = 0; i < 4; i++)
    {
        if (i == 0 )
        {
            timeUnits  = 604800;
        }
        else if (i == 1)
        {
            timeUnits  = 86400;
        }
        else if (i == 2)
        {
            timeUnits  = 3600;
        }
        else
        {
            timeUnits  = 60;                    
        }
          
        if ( true == isInteger(dhcpLease / timeUnits) )
        {
            break; 
        }          
    }

  if ( flag == "slave" )
  {
    setSelect('dhcpLeasedTimeFrag', timeUnits);
    if(infinite)
setText('SlaveLeasedTime', dhcp2_language['bbsp_infinitetime']);
    else
setText('SlaveLeasedTime', dhcpLease /timeUnits);
  }
else if ( flag == "main" )
{
    setSelect('maindhcpLeasedTimeFrag', timeUnits);
    if(infinite)
setText('MainLeasedTime', dhcp2_language['bbsp_infinitetime']);
    else
setText('MainLeasedTime', dhcpLease /timeUnits);
}
else
{
AlertEx(dhcp2_language['bbsp_poolinvalid']);
}

}


function setAllDisable()
{
setDisable('DHCPEnable',1);
setDisable('SlaveEthStart',1);
setDisable('dhcpLeasedTimeFrag',1);
setDisable('SlaveEthEnd',1);
setDisable('SlaveLeasedTime',1);
setDisable('dhcpOption60',1);
setDisable('dnsSecPri',1);
setDisable('dnsSecSec',1);


if (conditionpoolfeature == 1)
{       
    setDisable('Option60Mode',1);
}
else
{
setDisable('dhcpOption43',1);
setDisable('ntpserver',1);
}
}

function setApDisplay()
{
if (IsAPFlagfeature == 1)
{
setDisplay("SecondaryServerPool",0);
}
}

function LoadFrame() 
{
setDisplay("ethIpAddressRow",0);
setDisplay("ethSubnetMaskRow",0);
if (true == IsBJUNICOMNormalUser())
{
document.getElementById('DhcpServerFormtable').style.display = "none";
setDisplay("ethIpAddressRow",1);
setDisplay("ethSubnetMaskRow",1);
}
if((curUserType != sysUserType) && (GetCfgMode().PCCWHK == "1"))
{
setDisplay( "DhcpPoolPanel" , 0 );
setDisplay( "SecondaryServerPool" , 0 );
}
if((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY"))
{
setDisplay('dhcpL2relayRow',0);
setDisplay( "DhcpPoolPanel" , 0 );
setDisplay( "SecondaryServerPool" , 0 );
setDisplay("dnsSecPriRow",0);
setDisplay("dnsSecSecRow",0);
setDisplay('dhcpMainOption125Row', 0);
}
if(((hiderelay125feature == '1') && (curUserType != sysUserType))
|| (true == IsSonetHN8055QUser()) ||(true == IsSonetNewNormalUser()))
{
setDisplay('dhcpL2relayRow',0);
setDisplay('dhcpMainOption125Row',0);
}

if (GetRunningMode() == "1")
{
setDisplay( "DhcpPoolPanel" , 1 );
}
else
{
setDisplay( "DhcpPoolPanel" , 0 );
}

if ("1" == GetCfgMode().DT_HUNGARY)
    {
        setDisplay( "SecondaryServerPool" , 0 );
setDisplay("dnsSecPriRow",0);
setDisplay("dnsSecSecRow",0);
    }

with ( document.forms[0] ) 
{    
setMainDhcp();
setDhcp(LanIpInfos[1]);
setDisplay('dhcpPoolInfo',1);
    } 
   
    if (curUserType != sysUserType && false == IsSonetUser())
{
setDisplay("dnsMainPri",1);
setDisplay("dnsMainSec",1);
setDisplay("dnsSecPri",1);
setDisplay("dnsSecSec",1);
}

if ((curUserType != sysUserType)&& ((true == IsOSKNormalUser()) || (true == IsAISNormalUser()) || (true == IsBJUNICOMNormalUser()) || (true == IsDigicelNormalUser())))
    {
setDisplay("dnsMainPri",0);
setDisplay("dnsMainSec",0); 
setDisplay("dnsSecPri",0);
setDisplay("dnsSecSec",0);
    }

if (curUserType != sysUserType && true == IsTrueNormalUser())
{
setDisplay("dnsMainPri",0);
setDisplay("dnsMainSec",0); 
}

if(GetCfgMode().PCCWHK == "1")
{   
setDisable("dhcpSrvType",1);
setDisable("dhcpL2relay",1);
setDisplay("dnsMainPriRow",0);
setDisplay("dnsMainSecRow",0);
setDisplay("dnsSecPriRow",0);
setDisplay("dnsSecSecRow",0);
}

loadlanguage();

if(true == TELMEX)
{
    setDisplay('SecondaryServerPool', 0);
setDisplay("dnsSecPriRow",0);
setDisplay("dnsSecSecRow",0);
setDisplay('dhcpMainOption125Row', 0);
}

if ('PCCW' == CfgModeWord.toUpperCase() || GetCfgMode().PCCWHK == "1")
    {
        setDisplay('dhcpMainOption125Row', 0);        
    }

var slavepoolenable;
if (conditionpoolfeature == 1)
{
normaluserenable = ConditionDhcpInfos[0].NormalUserEnable;
slavepoolenable = ConditionDhcpInfos[0].Enable;

setDisplay('dhcpOption43Row', 0);
setDisplay('ntpserverRow', 0);
}
else
{       
normaluserenable = SlaveDhcpInfos[0].NormalUserEnable;
slavepoolenable = SlaveDhcpInfos[0].Enable;
setDisplay('Option60ModeRow', 0);
}

if ((option240feature == 1) && (conditionpoolfeature == 1))
{
    setDisplay('dhcpOption240Row', 1);
}
else
{
    setDisplay('dhcpOption240Row', 0);
}

if((true == TELMEX) || (GetCfgMode().PCCWHK == "1") || ("1" == GetCfgMode().DT_HUNGARY)
   || ((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY"))
   || (true == IsBJUNICOMNormalUser())
   || (curCfgModeWord.toUpperCase() == "ROMANIADT2"))
{
setDisplay("dnsSecPriRow",0);
setDisplay("dnsSecSecRow",0);
if(curUserType == sysUserType && GetCfgMode().PCCWHK == "1" && gstuseallslvpool != "1")
{
setDisplay('SecondaryServerPool', 1);
}
else
{
setDisplay('SecondaryServerPool', 0);
}
}
else if(gstuseallslvpool == "1")
{
setDisplay('SecondaryServerPool', 0);
}
else
{
if(slavepoolenable == 1)
{
setDisplay("dnsSecPriRow",1);
setDisplay("dnsSecSecRow",1);
}
setDisplay('SecondaryServerPool', 1);
}

if((("1" == norightslavefeature) && (curUserType != sysUserType))
|| (true == IsSonetHN8055QUser()))
{
setDisplay('SecondaryServerPool', 0);
}

if (slavepoolenable == 0)
{
setDisplay('SlaveIpAddrRow', 0);
setDisplay('SlaveMaskRow', 0);
setDisplay('SlaveSubnetMaskRow', 0);
setDisplay('SlaveEthStartRow', 0);
setDisplay('SlaveEthEndRow', 0);
setDisplay('SlaveLeasedTimeRow', 0);
setDisplay('dhcpOption60Row', 0);
if (conditionpoolfeature == 1)
{
setDisplay('Option60ModeRow', 0);

}
else
{
setDisplay('dhcpOption43Row', 0);
setDisplay('ntpserverRow', 0);
}
setDisplay('dnsSecPriRow', 0);
setDisplay('dnsSecSecRow', 0);
}
else
{
setDisplay('SlaveConfigForm', 1);
}

    if((curUserType != sysUserType)&&(normaluserenable == '0'))
{
setAllDisable();
}

    if ('CLARO' == CfgModeWord.toUpperCase() ||
'1' == ptvdfflag || 'CLARODR' == CfgModeWord.toUpperCase())
    {
    setDisplay("dnsMainPri",0);
setDisplay("dnsMainSec",0); 
    }

if (SingtelMode == '1')
    {
    if (curUserType != sysUserType)
    {
    setDisplay('dhcpSrvTypeRow', 0);
     setDisplay('dhcpL2relayRow', 0);   
     setDisplay('dhcpMainOption125Row', 0);     
    }
    setDisplay( "SecondaryServerPool" , 0 );
    }
if (true == IsBJUNICOMNormalUser())
{
setDisplay("dhcpL2relayRow",0);
setDisplay("dhcpMainOption125Row",0);
setDisplay("LanHostIPRow",0);
setDisplay("LanHostMaskRow",0);
setDisplay("dnsMainPriRow",0);
setDisplay("dnsMainSecRow",0);
setDisable("MainLeasedTime",1);
}

if(multioptionsfeature == '0')
{
setDisplay('OptionsEnableRow',0);
}
else
{
setDisplay('OptionsEnableRow',1);
}

enbleDHCP();
setApDisplay();

// CM
if (ProductType == '3')
{
setDisplay('SecPoolConfigForm', 0);
}

if(1 == IsPTVDFFlag || 1 == isSAFARICOM)
{
if(IsDNSLockEnable == "1")
{
setDisplay("dnsMainPri",1);
setDisplay("dnsMainSec",1);
}
else
{
setDisplay("dnsMainPri",0);
setDisplay("dnsMainSec",0);
}
}
if (CfgMode == "DMASMOVIL2WIFI")
{
setDisplay("dnsMainPri",1);
setDisplay("dnsMainSec",1);
}
if(curCfgModeWord.toUpperCase() == "TOTALPLAY" || curCfgModeWord.toUpperCase() == "TOTALPLAY2"){
   setDisplay( "SecondaryServerPool" , 0 );
}
}

function setMainDhcp()
{
with(document.forms[0])
{
setCheck('dhcpSrvType', MainDhcpRange[0].enable);
setCheck('dhcpL2relay', MainDhcpRange[0].l2relayenable);
        setCheck('dhcpMainOption125', MainDhcpRange[0].X_HW_Option125Enable);
        
setElementInnerHtmlById("LanHostIP", LanIpInfos[0].ipaddr);
setElementInnerHtmlById("LanHostMask", LanIpInfos[0].subnetmask);
setText('mainstartipaddr', MainDhcpRange[0].startip);
setText('mainendipaddr', MainDhcpRange[0].endip);
setText('HGWEthStart', MainDhcpRange[0].HGWstartip);
setText('HGWEthEnd', MainDhcpRange[0].HGWendtip);
setText('STBEthStart', MainDhcpRange[0].STBstartip);
setText('STBEthEnd', MainDhcpRange[0].STBendtip);
setText('CameraEthStart', MainDhcpRange[0].Camerastartip);
setText('CameraEthEnd', MainDhcpRange[0].Cameraendtip);
setText('ComputerEthStart', MainDhcpRange[0].Computerstartip);
setText('ComputerEthEnd', MainDhcpRange[0].Computerendtip);
setText('PhoneEthStart', MainDhcpRange[0].Phonestartip);
setText('PhoneEthEnd', MainDhcpRange[0].Phoneendtip);
if (true == IsBJUNICOMNormalUser())
{
setText('ethIpAddress',LanHostInfo.ipaddr);
setText('ethSubnetMask',LanHostInfo.subnetmask);
}
if(GetCfgMode().PCCWHK != "1")
{
setText('dnsMainPri', MainDhcpRange[0].MainPriDNS);
setText('dnsMainSec', MainDhcpRange[0].MainSecDNS);
}
setLease(dhcpmain.leasetime, "main");

SetDHCPServerDisplay(MainDhcpRange[0].enable);
}
}

function setDhcp(dhcpst)
{
with(document.forms[0])
{
if (conditionpoolfeature == 1)
{
    setText('SlaveEthStart', ConditionDhcpInfos[0].DhcpStart);
    setText('SlaveEthEnd', ConditionDhcpInfos[0].DhcpEnd);
setText('SlaveIpAddr', ConditionDhcpInfos[0].Gateway);
setText('SlaveMask', ConditionDhcpInfos[0].Gatewaymask);
setDisable('SlaveIpAddr', 0);
setDisable('SlaveMask', 0);
setText('dhcpOption60', ConditionDhcpInfos[0].Option60);
    setSelect('Option60Mode', ConditionDhcpInfos[0].Option60mode);
    setText('dhcpOption43',ConditionDhcpInfos[0].option43);
    if(GetCfgMode().PCCWHK != "1")
    {
    setText('dnsSecPri', ConditionDhcpInfos[0].SlaPriDNS);
    setText('dnsSecSec', ConditionDhcpInfos[0].SlaSecDNS);
    }
    
    setLease(ConditionDhcpInfos[0].LeaseTime, "slave");
    setCheck('DHCPEnable', ConditionDhcpInfos[0].Enable);
if (option240feature == 1)
{
    setText('dhcpOption240', option240);
}
if(multioptionsfeature == '1')
{
setCheck('OptionsEnable', MainDhcpRange[0].OptionEnable);
}

}
else
{
    setText('SlaveEthStart', SlaveDhcpInfos[0].dhcpStart);
    setText('SlaveEthEnd', SlaveDhcpInfos[0].dhcpEnd);
setText('SlaveIpAddr', LanIpInfos[1].ipaddr);
setText('SlaveMask', LanIpInfos[1].subnetmask);
if (IsPTVDFFlag == 1)
{
setDisable('SlaveIpAddr', 0);
setDisable('SlaveMask', 0);
}
else 
{
setDisable('SlaveIpAddr', 1);
setDisable('SlaveMask', 1);
}
setText('dhcpOption60', SlaveDhcpInfos[0].option60);
    if(GetCfgMode().PCCWHK != "1")
    {
setText('dnsSecPri', SlaveDhcpInfos[0].SlaPriDNS);
setText('dnsSecSec', SlaveDhcpInfos[0].SlaSecDNS);
    }
    setText('ntpserver', SlaveDhcpInfos[0].ntpsvr);
    setText('dhcpOption43', SlaveDhcpInfos[0].Option43);
    setLease(SlaveDhcpInfos[0].LeaseTime, "slave");

    setCheck('DHCPEnable', SlaveDhcpInfos[0].Enable);
}
}
}

function checkPoolPara() 
{
   with ( document.forms[0] ) 
   {
      var poolPara = new Array(new stipaddrpool(getValue("HGWEthStart"), getValue("HGWEthEnd")),
                               new stipaddrpool(getValue("STBEthStart"), getValue("STBEthEnd")),
                               new stipaddrpool(getValue("CameraEthStart"), getValue("CameraEthEnd")),
                               new stipaddrpool(getValue("ComputerEthStart"), getValue("ComputerEthEnd")),
                               new stipaddrpool(getValue("PhoneEthStart"), getValue("PhoneEthEnd")));  
      var deviceType = new Array('HGW', 'STB', 'Camera', 'Computer', 'Phone'); 

      var index = 0;
      var indexTemp = 0;
      if (1 == getCheckVal('dhcpSrvType'))
      {
        for (index=0;index<5;index++)
        {
           if (("" == poolPara[index].startip) && ("" == poolPara[index].endip))
           {
               continue;
           }  

           if (isValidIpAddress(poolPara[index].startip) == false)
           {
       AlertEx(dhcp2_language['bbsp_startipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpserinvalid']);
               return false;
           }

           if (isBroadcastIp(poolPara[index].startip, LanIpInfos[0].subnetmask) == true)
           {
       AlertEx(dhcp2_language['bbsp_startipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpserinvalid']);
               return false;
           }

           if (false == isSameSubNet(poolPara[index].startip, LanIpInfos[0].subnetmask, LanIpInfos[0].ipaddr, LanIpInfos[0].subnetmask))
           {
               AlertEx(dhcp2_language['bbsp_startipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpsermustsamehost']);
               return false;
           }

           if (!(isEndGTEStart(poolPara[index].startip, mainstartipaddr.value)))
           {
               AlertEx(dhcp2_language['bbsp_startipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpmustinpriserpool']);
               return false;
           }

           if (isValidIpAddress(poolPara[index].endip) == false) 
           {
       AlertEx(dhcp2_language['bbsp_endipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpinvalid']);
               return false;
           }

           if(isBroadcastIp(poolPara[index].endip, LanIpInfos[0].subnetmask) == true)
           {
       AlertEx(dhcp2_language['bbsp_endipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpinvalid']);
               return false;
           }

           if (false == isSameSubNet(poolPara[index].endip,LanIpInfos[0].subnetmask,LanIpInfos[0].ipaddr,LanIpInfos[0].subnetmask))
           {
               AlertEx(dhcp2_language['bbsp_endipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpsermustsamesubhost']);
               return false;
           }

           if (!(isEndGTEStart(poolPara[index].endip, poolPara[index].startip))) 
           {
               AlertEx(dhcp2_language['bbsp_endipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpsermustgtrstip']);
               return false;
           }

           if (!(isEndGTEStart(mainendipaddr.value, poolPara[index].endip)))
           {
               AlertEx(dhcp2_language['bbsp_endipaddr']+deviceType[index] + dhcp2_language['bbsp_pridhcpsermustinpripool']);
               return false;
           }
        }

        for (index=0;index<5;index++)
        {
           if (("" == poolPara[index].startip) && ("" == poolPara[index].endip))
           {
               continue;
           }  

   for (indexTemp=index+1;indexTemp<5;indexTemp++)
           {
               if (("" == poolPara[indexTemp].startip) && ("" == poolPara[indexTemp].endip))
               {
                   continue;
               } 

   if ( (isEndGTEStart(poolPara[indexTemp].startip, poolPara[index].startip) && isEndGTEStart(poolPara[index].endip, poolPara[indexTemp].startip) ) 
      || (isEndGTEStart(poolPara[index].startip, poolPara[indexTemp].startip) && isEndGTEStart(poolPara[indexTemp].endip, poolPara[index].startip) ))
   {
                   AlertEx(dhcp2_language['bbsp_startipaddr']+deviceType[index] + dhcp2_language['bbsp_poolandtype']+deviceType[indexTemp] + dhcp2_language['bbsp_secpoolconflict']);
                   return false;   
   }
   }
}
      }
    }   
    return true;
}

function IsDhcpOption60Valid(value)
{
    var uiDotCount = 0;
    var i;
    var chDot = '*';
    var uiLength = value.length;

    for (i = 0; i < value.length; i++)
    {
    if(value.charAt(i)==chDot)
        {
            uiDotCount++; 
        }
    }   

    if (uiDotCount > 2)
    {
        return false;
    }

    if (0== uiDotCount)
    {
        return true;
    }

    if ((1 == uiDotCount) 
        && (value.charAt(0) != chDot) 
        && (value.charAt(uiLength-1) != chDot))
    {
        return false;
    }

    if ((2 == uiDotCount) 
        && ((value.charAt(0) != chDot) 
        || (value.charAt(uiLength-1) != chDot)))
    {
        return false
    }
    return true;
}


function  dnsipcheck(ip)
{  
     if (ip.length == 0)
 {
     return true;
 }
 if((isAbcIpAddress(ip) == false) || (isValidIpAddress(ip) == false)  )
 {
  return false;
 }
return true;
}

function ParseNtpServerResult(string)
{   
    var splitobj = ",";
    var subString = string.split(splitobj);
    var stringlength = 0;

    stringlength = string.length;

    if (subString.length > 0 )
    {
    for ( var i = 0 ; i < subString.length ; i++ )
{
     if(false == dnsipcheck(subString[i]))
    {
AlertEx(dhcp2_language['bbsp_ntpserverinvalid']);
return false;
    }
}
}
return true;
}
     

function ParseOption60Result(string)
{   
    var splitobj = ",";
    var subString = string.split(splitobj);
    
    if (subString.length > 0 )
    {
    for ( var i = 0 ; i < subString.length ; i++ )
    {
          if (subString[i] == "")
          {
              return false;
          }
          
  if (IsDhcpOption60Valid(subString[i]) == false)
  {
return false;
  }
   }
    }
    
    return true;
}

function ParseConditionOption60Result(string, mode)
{
    var splitobj = ",";
    var subString = string.split(splitobj);
    
    var i = 0;
    var chDot = '*';
    
    if (subString.length > 1)
    {   
        if (mode == "Exact")
        {
            if (ParseOption60Result(string) ==  false)
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
    else
    {
        for (i = 0; i < string.length; i++)
        {
    if(string.charAt(i) == chDot)
            {
                return false;
            }
        }      
    }
    
    return true;
}
        
function isHexaDigit(digit) {
   var hexVals = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                           "A", "B", "C", "D", "E", "F", "a", "b", "c", "d", "e", "f");
   var len = hexVals.length;
   var i = 0;
   var ret = false;

   for ( i = 0; i < len; i++ )
      if ( digit == hexVals[i] ) break;

   if ( i < len )
      ret = true;

   return ret;
}

function IsDhcpOption43Valid(Option43)
{
    var uiDotCount = 0;
    var i;
    var uiLength = Option43.length;

if (uiLength > 64)
{
    AlertEx(dhcp2_language['bbsp_option43leninvalid']);
    return false;
}

if (('0' == Option43.charAt(0) && 'x' == Option43.charAt(1)) || ('0' == Option43.charAt(0) && 'X' == Option43.charAt(1)))
{
    if ((Option43.length)%2 == 1)
{
     AlertEx(dhcp2_language['bbsp_option43invalid']);
             return false;
}
        for (i = 2; i < Option43.length; i++)
       {
        if (isHexaDigit(Option43.charAt(i)) == false)
           {
        AlertEx(dhcp2_language['bbsp_option43invalid']);
                return false;
           }
       }
   }
    return true;
}
function IsLessThan(lip, rip)
{
var ladress = lip.split('.');
var radress = rip.split('.');
var ladnum = 0;
var radnum = 0;

for(var i = 0; i < 4; i++)
{
ladnum = ladnum + parseInt(ladress[i], 10);
radnum = radnum + parseInt(radress[i], 10);
}

if(ladnum <= radnum)
{
    return true;
}
return false;
}
function CheckFormGuestAllSLVPool() 
{
   with ( document.forms[0] ) 
   {  
      if (1 == getCheckVal('dhcpSrvType'))
      {
        if (isValidIpAddress(mainstartipaddr.value) == false)
        {
            AlertEx(dhcp2_language['bbsp_pridhcpstipinvalid']); 
            return false;
        }

        if (isBroadcastIp(mainstartipaddr.value, LanIpInfos[0].subnetmask) == true)
        {
            AlertEx(dhcp2_language['bbsp_pridhcpstipinvalid']);
            return false;
        }

        if (isValidIpAddress(mainendipaddr.value) == false) 
        {
            AlertEx(dhcp2_language['bbsp_dhcpendipinvalid']);
            return false;
        }


        if(isBroadcastIp(mainendipaddr.value, LanIpInfos[0].subnetmask) == true)
        {
            AlertEx(dhcp2_language['bbsp_dhcpendipinvalid']);
            return false;
        }

if (false == isSameSubNet(mainstartipaddr.value,LanIpInfos[0].subnetmask,LanIpInfos[0].ipaddr,LanIpInfos[0].subnetmask))
        {
AlertEx(dhcp2_language['bbsp_pridhcpstipmustsamesubhost']);
            return false;
        }
if (false == isSameSubNet(mainendipaddr.value,LanIpInfos[0].subnetmask,LanIpInfos[0].ipaddr,LanIpInfos[0].subnetmask))
        {
AlertEx(dhcp2_language['bbsp_pridhcpedipmustsamesubhost']);
            return false;
        }

        if (!(isEndGTEStart(mainendipaddr.value, mainstartipaddr.value))) 
        {
AlertEx(dhcp2_language['bbsp_priendipgeqstartip']);
            return false;
        }

if(PolicyRouteNum > 0)
      {
var IpStartNew = getValue('mainstartipaddr').split('.');
var IpEndNew = getValue('mainendipaddr').split('.');
var IpMinNew = parseInt(IpStartNew[3]);
var IpMaxNew = parseInt(IpEndNew[3]);

var IpStartOld = MainDhcpRange[0].startip.split('.');
var IpEndOld = MainDhcpRange[0].endip.split('.');
var IpMinOld = parseInt(IpStartOld[3]);
var IpMaxOld = parseInt(IpEndOld[3]);
if (IpMinNew > IpMinOld || IpMaxNew < IpMaxOld)
{
AlertEx(dhcp2_language['bbsp_ippoolpolicyrouteinvalid']);
return false;
}
}

        if (false == checkLease("bbsp_pripool",MainLeasedTime.value,maindhcpLeasedTimeFrag.value,dhcp2_language))
        {
            return false;
        }
      }
else if(ConditionDhcpInfos[1].Enable == 1)
{
AlertEx(dhcp2_language['bbsp_guestpoolwrong']);
            return false;
}
if(GetCfgMode().OSK == "1")
{
if ( getValue('dnsMainPri') != '' && (isValidIpAddress(getValue('dnsMainPri')) == false || isAbcIpAddress(getValue('dnsMainPri')) == false))
    {
        AlertEx(dhcp2_language['bbsp_pripoolpridnsinvalid']);
                return false;
    }
if ( getValue('dnsMainSec') != '' && (isValidIpAddress(getValue('dnsMainSec')) == false || isAbcIpAddress(getValue('dnsMainSec')) == false))
{
AlertEx(dhcp2_language['bbsp_pripoolsecdndinvalid']);
                return false;
    }
}
}

    setDisable('btnApply_ex', 1);
    setDisable('cancelValue_ex', 1);

    return true;
}
function CheckForm() 
{
   var IpMin;
   var IPMax;
   with ( document.forms[0] ) 
   {  
      if (1 == getCheckVal('dhcpSrvType'))
      {
        if (isValidIpAddress(mainstartipaddr.value) == false)
        {
            if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipinvalid_singtel']);
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipinvalid']);           
            }

            return false;
        }

        if (isBroadcastIp(mainstartipaddr.value, LanIpInfos[0].subnetmask) == true)
        {
            if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipinvalid_singtel']);           
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipinvalid']);
            }
            return false;
        }

if ( ('PCCWHK' == CfgModeWord.toUpperCase() || 'PCCW3MAC' == CfgModeWord.toUpperCase()) &&  (curUserType != sysUserType))
        {
if ( (getValue('mainstartipaddr').split(".")[0] == 192) && (getValue('mainstartipaddr').split(".")[1] == 168) && (getValue('mainstartipaddr').split(".")[2] == 8) && (getValue('mainstartipaddr').split(".")[3] > 127))  
{
AlertEx(dhcp2_language['bbsp_startipinvalid']);
return false;
}
        }


        if (isValidIpAddress(mainendipaddr.value) == false) 
        {
            if (SingtelMode == '1')
            {
                 AlertEx(dhcp2_language['bbsp_dhcpendipinvalid_singtel']);           
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_dhcpendipinvalid']);
            }
            return false;
        }


        if(isBroadcastIp(mainendipaddr.value, LanIpInfos[0].subnetmask) == true)
        {
            if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_dhcpendipinvalid_singtel']);           
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_dhcpendipinvalid']);
            }
            return false;
        }


        if (true == IsBJUNICOMNormalUser())
{
    if (false == isSameSubNet(mainstartipaddr.value,getValue('ethSubnetMask'),getValue('ethIpAddress'),getValue('ethSubnetMask')))
            {
            if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipmustsamesubhost_singtel']);            
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipmustsamesubhost']);
            }
                return false;
            }
if (false == isSameSubNet(mainendipaddr.value,getValue('ethSubnetMask'),getValue('ethIpAddress'),getValue('ethSubnetMask')))
            {
            if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_pridhcpedipmustsamesubhost_singtel']);            
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_pridhcpedipmustsamesubhost']);
            }
                return false;
            }
}
else
{
    if (false == isSameSubNet(mainstartipaddr.value,LanIpInfos[0].subnetmask,LanIpInfos[0].ipaddr,LanIpInfos[0].subnetmask))
            {
if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipmustsamesubhost_singtel']);            
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_pridhcpstipmustsamesubhost']);
            }
                return false;
            }
if (false == isSameSubNet(mainendipaddr.value,LanIpInfos[0].subnetmask,LanIpInfos[0].ipaddr,LanIpInfos[0].subnetmask))
            {
if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_pridhcpedipmustsamesubhost_singtel']);            
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_pridhcpedipmustsamesubhost']);
            }
                return false;
            }
}

        if ( ('PCCWHK' == CfgModeWord.toUpperCase() || 'PCCW3MAC' == CfgModeWord.toUpperCase()) &&  (curUserType != sysUserType))
        {
if ( (getValue('mainendipaddr').split(".")[0] == 192) &&(getValue('mainendipaddr').split(".")[1] == 168) && (getValue('mainendipaddr').split(".")[2] == 8) && ( getValue('mainendipaddr').split(".")[3] > 127))  
{
AlertEx(dhcp2_language['bbsp_endipinvalid']);
return false;
}
        }

        if (!(isEndGTEStart(mainendipaddr.value, mainstartipaddr.value))) 
        {
if (SingtelMode == '1')
            {
                AlertEx(dhcp2_language['bbsp_priendipgeqstartip_singtel']);            
            }
            else
            {
                AlertEx(dhcp2_language['bbsp_priendipgeqstartip']);
            }
            return false;
        }
if(1 == gstwfpoolfeature)
{
if (!guestwififlag)
{
if((ConditionDhcpInfos[1].Gateway == LanIpInfos[0].ipaddr) && 
           ((IsLessThan(ConditionDhcpInfos[1].DhcpStart, mainendipaddr.value) && IsLessThan(mainstartipaddr.value, ConditionDhcpInfos[1].DhcpStart)) || 
       (IsLessThan(ConditionDhcpInfos[1].DhcpStart, mainstartipaddr.value) && IsLessThan(mainstartipaddr.value, ConditionDhcpInfos[1].DhcpEnd))))
        {
   AlertEx(dhcp2_language['bbsp_mainpoolingstwfpool']);
           return false;
        }
if((ConditionDhcpInfos[1].Gateway == LanIpInfos[1].ipaddr) && 
           ((IsLessThan(ConditionDhcpInfos[1].DhcpStart, getValue("SlaveEthEnd")) && IsLessThan(getValue("SlaveEthStart"), ConditionDhcpInfos[1].DhcpStart)) || 
       (IsLessThan(ConditionDhcpInfos[1].DhcpStart, getValue("SlaveEthStart")) && IsLessThan(getValue("SlaveEthStart"), ConditionDhcpInfos[1].DhcpEnd))))
        {
   AlertEx(dhcp2_language['bbsp_slavepoolingstwfpool']);
           return false;
        }
}
}
if(PolicyRouteNum > 0)
      {
var IpStartNew = getValue('mainstartipaddr').split('.');
var IpEndNew = getValue('mainendipaddr').split('.');
var IpMinNew = parseInt(IpStartNew[3]);
var IpMaxNew = parseInt(IpEndNew[3]);

var IpStartOld = MainDhcpRange[0].startip.split('.');
var IpEndOld = MainDhcpRange[0].endip.split('.');
var IpMinOld = parseInt(IpStartOld[3]);
var IpMaxOld = parseInt(IpEndOld[3]);
if (IpMinNew > IpMinOld || IpMaxNew < IpMaxOld)
{
if (SingtelMode == '1')
    {
    AlertEx(dhcp2_language['bbsp_ippoolpolicyrouteinvalid_singtel']);    
    }
    else
    {
    AlertEx(dhcp2_language['bbsp_ippoolpolicyrouteinvalid']);
}
return false;
}
}

        if (SingtelMode == '1')
        {
            if (false == checkLease("bbsp_pripool_singtel",MainLeasedTime.value,maindhcpLeasedTimeFrag.value,dhcp2_language))
            {
                return false;
            }        
        }
        else
        {
            if (false == checkLease("bbsp_pripool",MainLeasedTime.value,maindhcpLeasedTimeFrag.value,dhcp2_language))
            {
                return false;
            }
        }
        
        
if(GetCfgMode().PCCWHK != "1")
{
    if ( getValue('dnsMainPri') != '' && (isValidIpAddress(getValue('dnsMainPri')) == false || isAbcIpAddress(getValue('dnsMainPri')) == false))
    {
        if (SingtelMode == '1')
        {
            AlertEx(dhcp2_language['bbsp_pripoolpridnsinvalid_singtel']);        
        }
        else
        {
            AlertEx(dhcp2_language['bbsp_pripoolpridnsinvalid']);
        }
        
                return false;
    }
if (TELMEX != true)
{
if ( getValue('dnsMainSec') != '' && (isValidIpAddress(getValue('dnsMainSec')) == false || isAbcIpAddress(getValue('dnsMainSec')) == false))
{
    if (SingtelMode == '1')
    {
                        AlertEx(dhcp2_language['bbsp_pripoolsecdndinvalid_singtel']);    
    }
    else
    {
                        AlertEx(dhcp2_language['bbsp_pripoolsecdndinvalid']);
                    }
                    return false;
   }
   }
}
      }

if ((TELMEX != true)&&("1" != GetCfgMode().DT_HUNGARY)&&(!((curUserType != sysUserType) && (GetCfgMode().PCCWHK == "1"))) 
&& (!((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY")))
&& (!((curUserType != sysUserType) && ("1" == norightslavefeature))))
{
      if (getCheckVal("DHCPEnable") == 1) 
      {
if (("0" == slv_independency) && (1 != getCheckVal("dhcpSrvType")))
{
AlertEx(dhcp2_language['bbsp_startsecdhcp']);
return false;
}

var conditionroute = getValue("SlaveIpAddr");
var conditionmask = getValue("SlaveMask");

if (conditionpoolfeature == 1)
{            
if (isValidIpAddress(getValue("SlaveIpAddr")) == false) 
    {
    AlertEx(dhcp2_language['bbsp_secdhcpinvalid']);
    return false;
    }

            if (isValidSubnetMask(conditionmask) == false ) 
            {
                AlertEx(dhcp2_language['bbsp_secdhcpnaskinvalid']);
                return false;
            }

            if (isValidIpAddress(getValue("SlaveEthStart")) == false) 
    {
    AlertEx(dhcp2_language['bbsp_secdhcpstartipinvalid']);
    return false;
    }

    if (isBroadcastIp(getValue("SlaveEthStart"), conditionmask) == true)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpstartipinvalid']);
    return false;
    }

    if (false == isSameSubNet(getValue("SlaveEthStart"),conditionmask,conditionroute,conditionmask))
    {
    AlertEx(dhcp2_language['bbsp_secdhcpstipmustsamesubhost']);
    return false;
    }

    if (isValidIpAddress(getValue("SlaveEthEnd")) == false) 
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipinvalid']);
    return false;
    }

    if (isBroadcastIp(getValue("SlaveEthEnd"), conditionmask) == true)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipinvalid']);
    return false;
    }

    if (false == isSameSubNet(getValue("SlaveEthEnd"),conditionmask,conditionroute,conditionmask))
    {
    AlertEx(dhcp2_language['bbsp_secdhcpedipmustsamesubhost']);
    return false;
    }

    if (!(isEndGTEStart(getValue("SlaveEthEnd"), getValue("SlaveEthStart")))) 
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipgeqstartip']);
    return false;
    }

    if (getValue("SlaveEthStart") == conditionmask)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpstartipdifroute']);
    return false;
    }

    if (getValue("SlaveEthEnd") == conditionmask)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipdifroute']);
    return false;
    }

if (option240feature == 1)
{
    var tmp = getValue('dhcpOption240');
            var tmp1 = Base64Encode(tmp);

if (isValidAscii(tmp) != '')
            {
                    AlertEx(dhcp2_language['bbsp_option240invalid']);
                    return false;
            }

if (tmp1.length > 340)
{
    AlertEx(dhcp2_language['bbsp_option240leninvalid']);
                    return false;
}
}
}
        else
{
if (IsPTVDFFlag == 1)
{
if (conditionroute!= IPbr0 && conditionroute != IPbr00)
{
AlertEx(dhcp2_language['bbsp_secdhcpinvalid']);
return false;
}
}

    if (true == isSameSubNet(LanIpInfos[1].ipaddr,LanIpInfos[1].subnetmask,LanIpInfos[0].ipaddr,LanIpInfos[0].subnetmask))
    {
    AlertEx(dhcp2_language['bbsp_pridhcpsecdhcpdif']);
    return false;
    }

    if (isValidIpAddress(getValue("SlaveEthStart")) == false) 
    {
    AlertEx(dhcp2_language['bbsp_secdhcpstartipinvalid']);
    return false;
    }

    if (isBroadcastIp(getValue("SlaveEthStart"), LanIpInfos[1].subnetmask) == true)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpstartipinvalid']);
    return false;
    }

if (IsPTVDFFlag == 1)
{
if (false == isSameSubNet(getValue("SlaveEthStart"),conditionmask,conditionroute,conditionmask))
{
AlertEx(dhcp2_language['bbsp_secdhcpstipmustsamesubhost']);
return false;
}
}
else 
{
if (false == isSameSubNet(getValue("SlaveEthStart"),LanIpInfos[1].subnetmask,LanIpInfos[1].ipaddr,LanIpInfos[1].subnetmask))
{
AlertEx(dhcp2_language['bbsp_secdhcpstipmustsamesubhost']);
return false;
}
}

    if (isValidIpAddress(getValue("SlaveEthEnd")) == false) 
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipinvalid']);
    return false;
    }

    if (isBroadcastIp(getValue("SlaveEthEnd"), LanIpInfos[1].subnetmask) == true)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipinvalid']);
    return false;
    }

if (IsPTVDFFlag == 1)
{
if (false == isSameSubNet(getValue("SlaveEthEnd"),conditionmask,conditionroute,conditionmask))
{
AlertEx(dhcp2_language['bbsp_secdhcpstipmustsamesubhost']);
return false;
}
}
else 
{
if (false == isSameSubNet(getValue("SlaveEthEnd"),LanIpInfos[1].subnetmask,LanIpInfos[1].ipaddr,LanIpInfos[1].subnetmask))
{
AlertEx(dhcp2_language['bbsp_secdhcpedipmustsamesubhost']);
return false;
}
}

    if (!(isEndGTEStart(getValue("SlaveEthEnd"), getValue("SlaveEthStart")))) 
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipgeqstartip']);
    return false;
    }

    if (getValue("SlaveEthStart") == LanIpInfos[1].subnetmask)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpstartipdifroute']);
    return false;
    }

    if (getValue("SlaveEthEnd") == LanIpInfos[1].subnetmask)
    {
    AlertEx(dhcp2_language['bbsp_secdhcpendipdifroute']);
    return false;
    }
      }

var timeLease = getValue('SlaveLeasedTime');
if (false == checkLease("bbsp_secpool",timeLease,getSelectVal('dhcpLeasedTimeFrag'),dhcp2_language))
{
return false;
}

if(getValue('dhcpOption60').length == 0 )
{
AlertEx(dhcp2_language['bbsp_60required']);
return false;
}

if (isValidAscii(getValue('dhcpOption60')) != '')
{
AlertEx(dhcp2_language['bbsp_60'] + getValue('dhcpOption60') + dhcp2_language['bbsp_60invalid']);
return false;
}
 
if(false == isSafeStringExc(getValue('dhcpOption60'),'#='))
{
AlertEx(dhcp2_language['bbsp_60'] + getValue('dhcpOption60') + dhcp2_language['bbsp_60invalid']);
return false;
}

if (conditionpoolfeature == 1)
{
    var mode = getSelectVal('Option60Mode');
　          if (ParseConditionOption60Result(getValue('dhcpOption60'), mode) == false)
　          {
　　            AlertEx(dhcp2_language['bbsp_60'] + getValue('dhcpOption60') + dhcp2_language['bbsp_60invalid']);
　　            return false;
　          }
}
else
{
if (ParseOption60Result(getValue('dhcpOption60')) == false)
　          {
　　            AlertEx(dhcp2_language['bbsp_60'] + getValue('dhcpOption60') + dhcp2_language['bbsp_60invalid']);
　　            return false;
　          }
}
if(GetCfgMode().PCCWHK != "1")
{
     if ( getValue('dnsSecPri') != '' && (isValidIpAddress(getValue('dnsSecPri')) == false || isAbcIpAddress(getValue('dnsSecPri')) == false))
     {
         AlertEx(dhcp2_language['bbsp_secpoolpridnsinvalid']);
 return false;
     }

     if ( getValue('dnsSecSec') != '' && (isValidIpAddress(getValue('dnsSecSec')) == false || isAbcIpAddress(getValue('dnsSecSec')) == false))
     {
        AlertEx(dhcp2_language['bbsp_secpoolsecdnsinvalid']);
        return false;
     }
       } 
       
 
       var ntpip = getValue('ntpserver');
               var option43 = getValue('dhcpOption43');

               if (ntpip.length !=0)
               {
           if (ParseNtpServerResult(ntpip) == false)
                   {
               return false;
                   }
               }
 
               if (option43.length != 0)
               {
           if (isValidAscii(option43) == '')
           {
                if (IsDhcpOption43Valid(option43) == false)
                        {
            return false;
                        }
           }
          else
          {
              AlertEx(dhcp2_language['bbsp_option43invalid'] );
                      return false;
          }
              }
         }
     }
}


    if (false == checkPoolPara())
    {
        return false;
    }

    setDisable('btnApply_ex', 1);
    setDisable('cancelValue_ex', 1);

    return true;
}

function IsEnableSameTime()
{
    var mainEnable = getCheckVal('dhcpSrvType');
    var secEnable = getCheckVal('DHCPEnable');

    if ((mainEnable ==1) && (secEnable == 1))
    {
        return true;
    }
return false;
}

function ApplyOption240(base64, instance)
{ 
    var urlpara;
var url;
    var RequestFile = 'html/bbsp/dhcpservercfg/dhcp2.asp';
    var Form = new webSubmitForm();

if (instance == 0)
{
    Form.addParameter('x.Value', base64);
Form.addParameter('x.Enable', 1);
Form.addParameter('x.Tag', 240);
    urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool.1.DHCPOption'
           + '&RequestFile=' + RequestFile;
url = 'add.cgi?' + urlpara;
}
else
{
    Form.addParameter('x.Value',base64);
    urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool.1.DHCPOption.1'
              + '&RequestFile=' + RequestFile;
    url = 'set.cgi?' + urlpara;
}

Form.addParameter('x.X_HW_Token', getValue('onttoken'));  
Form.setAction(url);
Form.submit();

}
function GetPolicyRouteListLength(PolicyRouteList, Type)
{
var Count = 0;

if (PolicyRouteList == null)
{
return 0;
}
for (var i = 0; i < PolicyRouteList.length; i++)
{
if (PolicyRouteList[i] == null)
{
continue;
}

if (PolicyRouteList[i].Type == Type)
{
Count++;
}
}

return Count;
}

function GetCurrentLoginIP()
{
var CurUrlIp = (window.location.host).toUpperCase();

return CurUrlIp;
}

function CheckFormBJUNICOM() 
{
   var ethIpAddress = getValue('ethIpAddress');
   var ethSubnetMask = getValue('ethSubnetMask');

   {
      if ( isValidIpAddress(ethIpAddress) == false ) {
         AlertEx(dhcp_language['bbsp_ipmhaddrp'] + ethIpAddress + dhcp_language['bbsp_isinvalidp']);
         return false;
      }
      if ( isValidSubnetMask(ethSubnetMask) == false ) {
         AlertEx(dhcp_language['bbsp_subnetmaskmh'] + ethSubnetMask + dhcp_language['bbsp_isinvalidp']);
         return false;
      }
      if ( isMaskOf24BitOrMore(ethSubnetMask) == false ) 
      {
          AlertEx(dhcp_language['bbsp_subnetmaskmh'] + ethSubnetMask + dhcp_language['bbsp_isinvalidp']);
          return false;
      }
      
      if(isHostIpWithSubnetMask(ethIpAddress, ethSubnetMask) == false)
      {
          AlertEx(dhcp_language['bbsp_ipmhaddrp'] + ethIpAddress + dhcp_language['bbsp_isinvalidp']);
          return false;
      }
      if ( isBroadcastIp(ethIpAddress, ethSubnetMask) == true ) {
         AlertEx(dhcp_language['bbsp_ipmhaddrp'] + ethIpAddress + dhcp_language['bbsp_isinvalidp']);
         return false;
      }  
    } 


    var Reboot = (GetPolicyRouteListLength(PolicyRouteListAll, "SourceIP") > 0 && getValue('ethIpAddress') != LanIpInfos[0].ipaddr) ? dhcp_language['bbsp_resetont']:"";
var result = true;
if (((getValue('ethIpAddress') != LanIpInfos[0].ipaddr) && (GetCurrentLoginIP() == LanIpInfos[0].ipaddr)))
{
result = ConfirmEx(dhcp_language['bbsp_dhcpconfirmnote']+Reboot);
}

return result;


}

function SubmitOptions()
{
var options_60 = getValue('MultidhcpOption60');
var options_43 = getValue('MultidhcpOption43');

if(getValue('MultidhcpOption60').length == 0 )
{
AlertEx(dhcp2_language['bbsp_60required']);
return false;
}

if (isValidAscii(getValue('MultidhcpOption60')) != '')
{
AlertEx(dhcp2_language['bbsp_60'] + getValue('MultidhcpOption60') + dhcp2_language['bbsp_60invalid']);
return false;
}
 
if(false == isSafeStringExc(getValue('MultidhcpOption60'),'#='))
{
AlertEx(dhcp2_language['bbsp_60'] + getValue('MultidhcpOption60') + dhcp2_language['bbsp_60invalid']);
return false;
}
else
{
var RequestFile = 'html/bbsp/dhcpservercfg/dhcp2.asp';

var DSASpecCfgParaList = new Array(new stSpecParaArray("x.VendorClassID",options_60, 1),
new stSpecParaArray("x.X_HW_Option43",options_43, 1));
var url = '';
if( selctIndex == -1 )
{
url = 'add.cgi?x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool'
+ '&RequestFile='+ RequestFile;
}
else
{
url = 'set.cgi?x=' + MoptionArray[selctIndex].domain
+ '&RequestFile=' + RequestFile;
}
setDisable('DHCPEnable',1);
setDisable('dhcpSrvType',1);
setDisable('dhcpL2relay',1);
setDisable('dhcpMainOption125',1);
setDisable('OptionsEnable',1);
setDisable('btnSubmit',1);
setDisable('CancelOptions',1);
setDisable('btnApply_ex',1);
setDisable('cancelValue_ex',1);
var Parameter = {};
Parameter.asynflag = null;
Parameter.FormLiList = OptionsConfigFormList;
Parameter.SpecParaPair = DSASpecCfgParaList;
var tokenvalue = getValue('onttoken');
HWSetAction(null, url, Parameter, tokenvalue);
}
}

function IsSubmitPtvdfGuestwifi()
{
if (ptvdfflag ==1)
{
if (SlaveDhcpInfos[0].Enable == getCheckVal('DHCPEnable')  && getCheckVal('DHCPEnable') ==0)
{
return false;
}
else
{
return true;
}
}
else
{
return false;
}
}

function PtvdfGuestwifiSubmit(str)
{
    if (guestflag == 0 && IsSubmitPtvdfGuestwifi())
    {
var SubmitParaForm = str;
        $.ajax({
            type : "POST",
            async : false,
            cache : false,
            data : SubmitParaForm + "&x.X_HW_Token=" + getValue('onttoken'),
            url : 'add.cgi?x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool&RequestFile=html/bbsp/dhcpservercfg/dhcp2.asp',
            success : function(data) {

        }});
    }
}

function CheckDNSConfigPTVDF()
{
if ((getValue('dnsMainPri') != MainDhcpRange[0].MainPriDNS) 
|| (getValue('dnsMainSec') != MainDhcpRange[0].MainSecDNS))
{
if(false == ConfirmEx(dhcp2_language['bbsp_ptvdf_dns'])) 
{
setDisable('btnApply_ex', 0);
setDisable('cancelValue_ex', 0);
return false;
}
}

return true;
}
function ApplyConfig()
{
if (IsNETLIFElag == 1)
{
var bDisplay = getCheckVal('DHCPEnable');
if (bDisplay == "1")
{
if(confirm(dhcp2_language['bbsp_DHCP_confirmtip']) == false)
{
return false;
}
}
}
if (true == IsBJUNICOMNormalUser())
{
if ((true != CheckFormBJUNICOM()) || (true != CheckForm()))
{
return false;
}

var Form = new webSubmitForm();
var url = '';
var RequestFile = 'html/bbsp/dhcpservercfg/dhcp2.asp';

Form.addParameter('m.IPInterfaceIPAddress',getValue('ethIpAddress'));
Form.addParameter('m.IPInterfaceSubnetMask',getValue('ethSubnetMask'));
Form.addParameter('z.DHCPServerEnable',getCheckVal('dhcpSrvType'));
if(1 == getCheckVal('dhcpSrvType'))
{
Form.addParameter('z.MinAddress',getValue('mainstartipaddr'));
Form.addParameter('z.MaxAddress',getValue('mainendipaddr'));
}
Form.addParameter('z.DHCPLeaseTime',getValue('MainLeasedTime')*getValue('maindhcpLeasedTimeFrag'));

url = 'set.cgi?'
+ 'm=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1'
+ '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&RequestFile=' + RequestFile;

Form.addParameter('x.X_HW_Token', getValue('onttoken'));

setDisable('dhcpSrvType',1);
Form.setAction(url);
Form.submit();
}
else if(gstuseallslvpool == "1")
{
if (true != CheckFormGuestAllSLVPool())
{
return false;
}
var Form = new webSubmitForm();
var url = '';
var RequestFile = 'html/bbsp/dhcpservercfg/dhcp2.asp';

if(1 == getCheckVal('dhcpSrvType'))
{
Form.addParameter('z.MinAddress',getValue('mainstartipaddr'));
Form.addParameter('z.MaxAddress',getValue('mainendipaddr'));
Form.addParameter('z.DHCPLeaseTime',getValue('MainLeasedTime')*getValue('maindhcpLeasedTimeFrag'));
}
if(GetCfgMode().OSK == "1")
{
var DnsMStr = getValue('dnsMainPri') + ',' + getValue('dnsMainSec');
if ( getValue('dnsMainPri') == 0)
{
DnsMStr = getValue('dnsMainSec');
}
if ( getValue('dnsMainSec') == 0)
{
DnsMStr = getValue('dnsMainPri');
} 
Form.addParameter('z.X_HW_DNSList',DnsMStr);
Form.addParameter('z.DHCPServerEnable',getCheckVal('dhcpSrvType'));
Form.addParameter('z.X_HW_DHCPL2RelayEnable',getCheckVal('dhcpL2relay'));
Form.addParameter('z.X_HW_Option125Enable',getCheckVal('dhcpMainOption125'));
}

url = 'set.cgi?'
+ '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&RequestFile=' + RequestFile;

Form.addParameter('x.X_HW_Token', getValue('onttoken'));
Form.setAction(url);
Form.submit();
}
else
{

if(false == CheckForm())
{
return false;
}

if('1' == ptvdfflag )
{
if(false == CheckDNSConfigPTVDF())
{
return false;
}
}

var Form = new webSubmitForm();
var submitparam = "";
with (document.forms[0])
{
if (conditionpoolfeature == 1)
{   
if (option240feature == 1)
{
var tmp = getValue('dhcpOption240');
ApplyOption240(Base64Encode(tmp), option240instance);
}

Form.addParameter('y.Enable',getCheckVal('DHCPEnable'));
if (getCheckVal("DHCPEnable") == 1) 
{
if(GetCfgMode().PCCWHK != "1")
{
var DnsSStr = getValue('dnsSecPri') + ',' + getValue('dnsSecSec');
if ( getValue('dnsSecPri') == 0)
{
DnsSStr = getValue('dnsSecSec');
}
if ( getValue('dnsSecSec') == 0)
{
DnsSStr = getValue('dnsSecPri');
} 
Form.addParameter('y.DNSServers',DnsSStr);
}

Form.addParameter('y.IPRouters',getValue('SlaveIpAddr'));
Form.addParameter('y.SubnetMask',getValue('SlaveMask'));
Form.addParameter('y.MinAddress',getValue('SlaveEthStart'));
Form.addParameter('y.MaxAddress',getValue('SlaveEthEnd'));
Form.addParameter('y.DHCPLeaseTime',getValue('SlaveLeasedTime')*getValue('dhcpLeasedTimeFrag'));
Form.addParameter('y.VendorClassID',getValue('dhcpOption60'));
Form.addParameter('y.VendorClassIDMode',getSelectVal('Option60Mode'));
if(multioptionsfeature == '1')
{
Form.addParameter('y.X_HW_Option43',getValue('dhcpOption43'));
Form.addParameter('z.X_HW_COND_POOL_MODE',getCheckVal('OptionsEnable'));
}
}
}
else
{
if ((curUserType == sysUserType) || (0 != normaluserenable))
{
if((true != TELMEX)&&("1" != GetCfgMode().DT_HUNGARY)&&(!((curUserType != sysUserType) && (GetCfgMode().PCCWHK == "1"))) 
&& (!((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY")))
&& (!((curUserType != sysUserType) && ("1" == norightslavefeature)))
&& (false == IsSonetHN8055QUser()))
{
                        Form.addParameter('y.DHCPEnable',getCheckVal('DHCPEnable'));
if(1 == gstwfpoolfeature)
{
if(ConditionDhcpInfos[1].Gateway == LanIpInfos[1].ipaddr)
{
if(LanIpInfos[1].enable == '1')
{
Form.addParameter('w.Enable',getCheckVal('DHCPEnable'));
}
else
{
Form.addParameter('w.Enable',LanIpInfos[1].enable);
}
if((getCheckVal('DHCPEnable') == '1') && (LanIpInfos[1].enable == '1'))
{
Form.addParameter('w.MinAddress',ConditionDhcpInfos[1].DhcpStart);
Form.addParameter('w.MaxAddress',ConditionDhcpInfos[1].DhcpEnd);
}
}
if(ConditionDhcpInfos[1].Gateway == LanIpInfos[0].ipaddr)
{
Form.addParameter('w.Enable',getCheckVal('dhcpSrvType'));
if(1 == getCheckVal('dhcpSrvType'))
{
Form.addParameter('w.MinAddress',ConditionDhcpInfos[1].DhcpStart);
Form.addParameter('w.MaxAddress',ConditionDhcpInfos[1].DhcpEnd);
}
}
}
}
if (getCheckVal("DHCPEnable") == 1) 
{
if(GetCfgMode().PCCWHK != "1")
{
var DnsSStr = getValue('dnsSecPri') + ',' + getValue('dnsSecSec');
if ( getValue('dnsSecPri') == 0)
{
DnsSStr = getValue('dnsSecSec');
}
if ( getValue('dnsSecSec') == 0)
{
DnsSStr = getValue('dnsSecPri');
} 
if((true != TELMEX) && (!((curUserType != sysUserType) && ("1" == norightslavefeature)))
&& (false == IsSonetHN8055QUser()))
{
Form.addParameter('y.DNSList',DnsSStr);
}
}

if((true != TELMEX)&&("1" != GetCfgMode().DT_HUNGARY)&&(!((curUserType != sysUserType) && (GetCfgMode().PCCWHK == "1"))) 
&& (!((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY")))
&& (!((curUserType != sysUserType) && ("1" == norightslavefeature)))
&& (false == IsSonetHN8055QUser()))
{
Form.addParameter('y.StartIP',getValue('SlaveEthStart'));
Form.addParameter('y.EndIP',getValue('SlaveEthEnd'));
Form.addParameter('y.LeaseTime',getValue('SlaveLeasedTime')*getValue('dhcpLeasedTimeFrag'));
Form.addParameter('y.Option60',getValue('dhcpOption60'));
Form.addParameter('y.NTPList',getValue('ntpserver'));
Form.addParameter('y.Option43',getValue('dhcpOption43'));
}
}
}
}
if (false == IsSingtelUser())
{
Form.addParameter('z.DHCPServerEnable',getCheckVal('dhcpSrvType'));
}
if((!((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY")))
&& (!((curUserType != sysUserType) && ("1" == hiderelay125feature)))
&& (false == IsSonetHN8055QUser())&& (false == IsSonetNewNormalUser()) && (false == IsSingtelUser()))
{
Form.addParameter('z.X_HW_DHCPL2RelayEnable',getCheckVal('dhcpL2relay'));
}
if ((true != TELMEX) && (!((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY")))
&& (!((curUserType != sysUserType) && ("1" == hiderelay125feature)))
&& (false == IsSonetHN8055QUser())
&& (false == IsSonetNewNormalUser())
&& ('PCCW' != CfgModeWord.toUpperCase())
&& (GetCfgMode().PCCWHK != "1")
&& (false == IsSingtelUser()))
{
Form.addParameter('z.X_HW_Option125Enable',getCheckVal('dhcpMainOption125'));
}

if(GetCfgMode().PCCWHK != "1")
{
var DnsMStr = getValue('dnsMainPri') + ',' + getValue('dnsMainSec');
if ( getValue('dnsMainPri') == 0)
{
DnsMStr = getValue('dnsMainSec');
}
if ( getValue('dnsMainSec') == 0)
{
DnsMStr = getValue('dnsMainPri');
} 
Form.addParameter('z.X_HW_DNSList',DnsMStr);
}

if(1 == getCheckVal('dhcpSrvType'))
{
Form.addParameter('z.MinAddress',getValue('mainstartipaddr'));
Form.addParameter('z.MaxAddress',getValue('mainendipaddr'));
}
Form.addParameter('z.DHCPLeaseTime',getValue('MainLeasedTime')*getValue('maindhcpLeasedTimeFrag'));
if(GetRunningMode() == "1")
{
Form.addParameter('z.X_HW_HGWStart',getValue('HGWEthStart'));
Form.addParameter('z.X_HW_HGWEnd',getValue('HGWEthEnd'));
Form.addParameter('z.X_HW_STBStart',getValue('STBEthStart'));
Form.addParameter('z.X_HW_STBEnd',getValue('STBEthEnd'));
Form.addParameter('z.X_HW_CameraStart',getValue('CameraEthStart'));
Form.addParameter('z.X_HW_CameraEnd',getValue('CameraEthEnd'));
Form.addParameter('z.X_HW_ComputerStart',getValue('ComputerEthStart'));
Form.addParameter('z.X_HW_ComputerEnd',getValue('ComputerEthEnd'));
Form.addParameter('z.X_HW_PhoneStart',getValue('PhoneEthStart'));
Form.addParameter('z.X_HW_PhoneEnd',getValue('PhoneEthEnd'));
}
            if (guestflag == 0 && ptvdfflag == 1 && IsSubmitPtvdfGuestwifi())
            {
            submitparam += "x.Enable=1";
            submitparam += "&x.MinAddress=" + getValue('SlaveEthStart');
            submitparam += "&x.MaxAddress=" + getValue('SlaveEthEnd');
            submitparam += "&x.IPRouters="  + LanIpInfos[1].ipaddr;
            submitparam += "&x.SubnetMask=" + LanIpInfos[1].subnetmask;
submitparam += "&x.DHCPLeaseTime=" + getValue('SlaveLeasedTime')*getValue('dhcpLeasedTimeFrag');
            }

}

var RequestFile = 'html/bbsp/dhcpservercfg/dhcp2.asp';
var urlpara;
if (IsEnableSameTime() == true)
{
if (conditionpoolfeature == 1)
{           
urlpara = 'z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&y=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool.1'
+ '&RequestFile=' + RequestFile;

}
else
{
if(((curUserType != sysUserType) && (GetCfgMode().PCCWHK == "1")) || (true == TELMEX) || ("1" == GetCfgMode().DT_HUNGARY)
|| ((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY"))
|| ((curUserType != sysUserType) && ("1" == norightslavefeature))
|| (true == IsSonetHN8055QUser())
|| (SingtelMode == '1')
|| (curCfgModeWord.toUpperCase() == "ROMANIADT2"))
{
urlpara = 'z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&RequestFile=' + RequestFile;
}
else if(1 == gstwfpoolfeature)
{
if (ptvdfflag ==1)
{
                    urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2'
                            + '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
                            + '&y=InternetGatewayDevice.X_HW_DHCPSLVSERVER'
                            + '&RequestFile=' + RequestFile; 
}
else
{
                    urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2'
                            + '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
                            + '&y=InternetGatewayDevice.X_HW_DHCPSLVSERVER'
                            + '&w=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool.2'
                            + '&RequestFile=' + RequestFile; 
}                        

}
else
{
urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2'
+ '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&y=InternetGatewayDevice.X_HW_DHCPSLVSERVER'
+ '&RequestFile=' + RequestFile;
}
}
}
else
{
if (conditionpoolfeature == 1)
{
urlpara = 'y=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool.1'
+ '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&RequestFile=' + RequestFile;
}
else
{
if (((curUserType != sysUserType) && (GetCfgMode().PCCWHK == "1"))  || (true == TELMEX) || ("1" == GetCfgMode().DT_HUNGARY)
|| ((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY"))
|| ((curUserType != sysUserType) && ("1" == norightslavefeature))
|| (true == IsSonetHN8055QUser())
|| (SingtelMode == '1'))
{
urlpara = 'z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&RequestFile=' + RequestFile;
}
else if(1 == gstwfpoolfeature)
{
                    if (IsSubmitPtvdfGuestwifi())
                    {
    urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2'
    + '&y=InternetGatewayDevice.X_HW_DHCPSLVSERVER'
    + '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
    + '&w=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool.2'
    + '&RequestFile=' + RequestFile;
                    }
                    else
                    {
                        urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2'
                                + '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
                                + '&RequestFile=' + RequestFile;
                    }
}
else
{
urlpara = 'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.2'
+ '&y=InternetGatewayDevice.X_HW_DHCPSLVSERVER'
+ '&z=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
+ '&RequestFile=' + RequestFile;
}
}
}

PtvdfGuestwifiSubmit(submitparam);
if (IsPTVDFFlag == 1)
{
Form.addParameter('x.IPInterfaceIPAddress', getValue('SlaveIpAddr'));
Form.addParameter('x.IPInterfaceSubnetMask', getValue('SlaveMask'));
}
Form.addParameter('x.X_HW_Token', getValue('onttoken'));
var url = 'set.cgi?' + urlpara;
setDisable('DHCPEnable',1);
setDisable('dhcpSrvType',1);
setDisable('dhcpL2relay',1);
setDisable('dhcpMainOption125',1);
setDisable('btnSubmit',1);
setDisable('CancelOptions',1);
setDisable('OptionsEnable',1);
setDisable('Newbutton',1);
setDisable('DeleteButton',1);

Form.setAction(url);
Form.submit();
}
} 
    
function enbleDHCP()
{ 
var bDisplay = getCheckVal('DHCPEnable');

setDisplay('SlaveConfigForm', bDisplay);

setDisplay('SlaveEthStartRow', bDisplay);
setDisplay('SlaveEthEndRow', bDisplay);
setDisplay('SlaveLeasedTimeRow', bDisplay);
setDisplay('dhcpOption60Row', bDisplay);
setDisplay('SlaveIpAddrRow', bDisplay);
setDisplay('SlaveMaskRow', bDisplay);
if ((conditionpoolfeature == 1))
{
        setDisplay('Option60ModeRow', bDisplay);
        if(multioptionsfeature == 1)
{
setDisplay('dhcpOption43Row',bDisplay);
}
}
else
{
        setDisplay('dhcpOption43Row', bDisplay);
        setDisplay('ntpserverRow', bDisplay);
}
setDisplay('dnsSecPriRow', bDisplay);
setDisplay('dnsSecSecRow', bDisplay);
if((true == TELMEX) || (GetCfgMode().PCCWHK == "1") || ("1" == GetCfgMode().DT_HUNGARY)
   || ((curUserType != sysUserType) && (curCfgModeWord.toUpperCase() == "RDSGATEWAY")))
    {
setDisplay("dnsSecPriRow",0);
setDisplay("dnsSecSecRow",0);
    }
    else
    {
setDisplay("dnsSecPriRow",bDisplay);
setDisplay("dnsSecSecRow",bDisplay);
    }
if(bDisplay == '0')
{
setDisplay('MulitOptions',bDisplay);
setDisplay('OptionsForm',bDisplay);
setDisplay('OptionsEnableRow',bDisplay);
}
else
{
if(multioptionsfeature == '1')
{
setDisplay('MulitOptionsRow',bDisplay);
setDisplay('OptionsEnableRow',bDisplay);
IsShowMulitOption();
}
}
if(1 == isSAFARICOM)
{
if(IsDNSLockEnable == "1")
{
setDisplay("dnsSecPri",1);
setDisplay("dnsSecSec",1);
}
else
{
setDisplay("dnsSecPri",0);
setDisplay("dnsSecSec",0);
}

}
   
}

function IsShowMulitOption()
{
var OptionValue = MainDhcpRange[0].OptionEnable;
if(OptionValue == '0')
{
setDisplay('MulitOptions',0);
}
else
{
setDisplay('MulitOptions',1);
}
}
var selectedPoolindex = -1; 

function setControl(index)
{
var multioption;
selctIndex = index;
    if (index == -1)
    {
    if(MoptionArray.length >= 4)
    {
        setDisplay('OptionsForm', 0);
    AlertEx(dhcp2_language['bbsp_optionconfigfull']);
    return;
}
multioption = new MultiOption("","","");
        AddFlag = true;
        setDisplay('OptionsForm', 1);
        setCtlDisplay(multioption);
     }
else if (index == -2)
{
setDisplay('OptionsForm', 0);
}
    else
    {
    multioption = MoptionArray[index];
        AddFlag = false;
        setDisplay('OptionsForm', 1);
        setCtlDisplay(multioption);
    }

    setDisable('btnSubmit',0);
    setDisable('CancelOptions',0);
}

function OnDeleteButtonClick(TableID)
{
    var CheckBoxList = document.getElementsByName(TableName+'rml');
var Form = new webSubmitForm();
var Count = 0;
for (var i = 0; i < CheckBoxList.length; i++)
{
if (CheckBoxList[i].checked != true)
{
continue;
}

Count++;
Form.addParameter(CheckBoxList[i].value,'');
}
setDisable('DeleteButton',1);
setDisable('btnSubmit',1);
    setDisable('CancelOptions',1);
Form.addParameter('x.X_HW_Token', getValue('onttoken'));
Form.setAction('del.cgi?'+'x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.DHCPConditionalServingPool' + '&RequestFile=html/bbsp/dhcpservercfg/dhcp2.asp');
Form.submit();
}  

function setCtlDisplay(multioption)
{
    setText('MultidhcpOption60',multioption.VendorClassID);
        setText('MultidhcpOption43',multioption.X_HW_Option43);
}

function SetDHCPL2Relay()
{
var enable = getCheckVal('dhcpL2relay');
}

function SetMainDHCPServer()
{
var enable = getCheckVal('dhcpSrvType');
SetDHCPServerDisplay(enable);
}

function SetDHCPServerDisplay(value)
{
if ( value == 1 || value == '1' )
{
setDisable("mainstartipaddr",0);
setDisable("mainendipaddr",0);
if (false == IsBJUNICOMNormalUser())
{
setDisable("MainLeasedTime",0);
}
setDisable("maindhcpLeasedTimeFrag",0);

setDisable("HGWEthStart",0);
setDisable("HGWEthEnd",0);
setDisable("STBEthStart",0);
setDisable("STBEthEnd",0);
setDisable("CameraEthStart",0);
setDisable("CameraEthEnd",0);
setDisable("ComputerEthStart",0);
setDisable("ComputerEthEnd",0);
setDisable("PhoneEthStart",0);
setDisable("PhoneEthEnd",0);
}
else
{    
setDisable("mainstartipaddr",1);
setDisable("mainendipaddr",1);
setDisable("MainLeasedTime",1);
setDisable("maindhcpLeasedTimeFrag",1);

setDisable("HGWEthStart",1);
setDisable("HGWEthEnd",1);
setDisable("STBEthStart",1);
setDisable("STBEthEnd",1);
setDisable("CameraEthStart",1);
setDisable("CameraEthEnd",1);
setDisable("ComputerEthStart",1);
setDisable("ComputerEthEnd",1);
setDisable("PhoneEthStart",1);
setDisable("PhoneEthEnd",1);
}
}

function CancelOption()
{
setDisplay('OptionsForm',0); 
}

function CancelConfig()
{
        
LoadFrame();   
}

function DhcpOptionsselectRemoveCnt(val)
{

}
var TableClass = new stTableClass("table_title width_per25", "table_right width_per75", "", "Select");
  
function InitLeasedTime()
{
var LeasedTimeIdArray = ["maindhcpLeasedTimeFrag", "dhcpLeasedTimeFrag"];
for(var i = 0; i < LeasedTimeIdArray.length; i++)
{
var LeasedTimeId = "#" + LeasedTimeIdArray[i];
if (ProductType == '2')
{
if ('DNZTELECOM2WIFI' != CfgModeWord.toUpperCase())
{
$(LeasedTimeId).append('<option value="60">'+ dhcp2_language['bbsp_minute_xd'] + '</option>');
}
$(LeasedTimeId).append('<option value="3600">'+ dhcp2_language['bbsp_hour_xd'] + '</option>');
$(LeasedTimeId).append('<option value="86400">'+ dhcp2_language['bbsp_day_xd'] + '</option>');
$(LeasedTimeId).append('<option value="604800">'+ dhcp2_language['bbsp_week_xd'] + '</option>');
}
else
{
$(LeasedTimeId).append('<option value="60">'+ dhcp2_language['bbsp_minute'] + '</option>');
$(LeasedTimeId).append('<option value="3600">'+ dhcp2_language['bbsp_hour'] + '</option>');
$(LeasedTimeId).append('<option value="86400">'+ dhcp2_language['bbsp_day'] + '</option>');
$(LeasedTimeId).append('<option value="604800">'+ dhcp2_language['bbsp_week'] + '</option>');
}
}
}

function InitOption60Mode()
{
$("#Option60Mode").append('<option value="Exact">'+ dhcp2_language['bbsp_op60_exact'] + '</option>');
$("#Option60Mode").append('<option value="Prefix">'+ dhcp2_language['bbsp_op60_prefix'] + '</option>');
$("#Option60Mode").append('<option value="Suffix">'+ dhcp2_language['bbsp_op60_suffix'] + '</option>');
$("#Option60Mode").append('<option value="Substring">'+ dhcp2_language['bbsp_op60_substring'] + '</option>');
}

</script>
</head>
<body onLoad="LoadFrame();" class="mainbody"> 
<div id="ConfigForm" action="../network/set.cgi"> 
<script language="JavaScript" type="text/javascript">
if (true == IsBJUNICOMNormalUser())
{
HWCreatePageHeadInfo("dhcptitle", GetDescFormArrayById(dhcp_language, "bbsp_mune"), GetDescFormArrayById(dhcp_language, ""), false);
document.getElementById("dhcptitle_content").innerHTML = dhcp_language['bbsp_dhcp_title']+dhcp_language['bbsp_dhcp_title1'];
}
else
{
if ("1" == GetRunningMode())
{
HWCreatePageHeadInfo("dhcp2", GetDescFormArrayById(dhcp2_language, "bbsp_mune"), GetDescFormArrayById(dhcp2_language, "bbsp_dhcp2_title"), false);
}
else
{ 
HWCreatePageHeadInfo("dhcp2", GetDescFormArrayById(dhcp2_language, "bbsp_mune"), GetDescFormArrayById(dhcp2_language, "bbsp_dhcp2_title2"), false);
}
}
</script> 
<div class="title_spread"></div>
<div id="DhcpServerPanel" >
<form id = "PriPoolConfigForm">
<table width="100%" id="DhcpServerFormtable" border="0" cellpadding="0" cellspacing="0" class="func_title"> 
<tr>
<script language="JavaScript" type="text/javascript">
if (SingtelMode == '1')
{
    document.write('<td BindText="bbsp_pripool_singtel"></td>');
}
else
{
    document.write('<td BindText="bbsp_pripool"></td>');
}
</script>
</tr>
</table>  


<table border="0" cellpadding="0" cellspacing="1"  width="100%">
<li   id="ethIpAddress" RealType="TextBox" DescRef="bbsp_ip" RemarkRef="Empty" ErrorMsgRef="Empty" Require="TRUE" BindField="m.IPInterfaceIPAddress"  MaxLength="15" InitValue="Empty" />
<li   id="ethSubnetMask" RealType="TextBox" DescRef="bbsp_ethIpMask" RemarkRef="Empty" ErrorMsgRef="Empty" Require="TRUE" BindField="m.IPInterfaceSubnetMask"  MaxLength="15"  InitValue="Empty" />
<script language="JavaScript" type="text/javascript">
if (SingtelMode == '1')
{
    document.write("\<li   id=\"dhcpSrvType\" RealType=\"CheckBox\" DescRef=\"bbsp_enablepridhcpmh_singtel\" RemarkRef=\"Empty\" ErrorMsgRef=\"Empty\"   Require=\"FALSE\"    BindField=\"Empty\"   InitValue=\"Empty\"  ClickFuncApp=\"onclick=SetMainDHCPServer\"\/\>");
}
else
{
    document.write("\<li   id=\"dhcpSrvType\" RealType=\"CheckBox\" DescRef=\"bbsp_enablepridhcpmh\" RemarkRef=\"Empty\" ErrorMsgRef=\"Empty\" Require=\"FALSE\"    BindField=\"Empty\"   InitValue=\"Empty\"  ClickFuncApp=\"onclick=SetMainDHCPServer\"\/\>");
}
</script>
<li   id="dhcpL2relay"        RealType="CheckBox"        DescRef="bbsp_enablel2relaymh"      RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"  ClickFuncApp="onclick=SetDHCPL2Relay"/>
<li   id="dhcpMainOption125"        RealType="CheckBox"        DescRef="bbsp_main_option125"       RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"/>
<li   id="LanHostIP"        RealType="HtmlText"        DescRef="bbsp_lanhostmh"         RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"/>
<li   id="LanHostMask"        RealType="HtmlText"        DescRef="bbsp_maskmh"         RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"/>
<li   id="mainstartipaddr"          RealType="TextBox"            DescRef="bbsp_startipmh"            RemarkRef="bbsp_mustbesamesubnet"     ErrorMsgRef="Empty"    Require="TRUE"     BindField="Empty"       InitValue="Empty"  MaxLength="15"/>
<li   id="mainendipaddr"            RealType="TextBox"            DescRef="bbsp_endipmh"              RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="TRUE"     BindField="Empty"           InitValue="Empty"  MaxLength="15"/>
<li   id="MainLeasedTime"           RealType="TextOtherBox"       DescRef="bbsp_leasedmh"             RemarkRef="Empty"    ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"   Elementclass="TextBox_2"    InitValue="[{Type:'select',Item:[{AttrName:'id',AttrValue:'maindhcpLeasedTimeFrag'},{AttrName:'class',AttrValue:'Select_2'}]}]"/>
<li   id="dnsMainPri"             RealType="TextBox"            DescRef="bbsp_pridnsmh"            RemarkRef="Empty"    ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"        InitValue="Empty"  MaxLength="15"/>
<li   id="dnsMainSec"             RealType="TextBox"            DescRef="bbsp_secdnsmh"            RemarkRef="Empty"    ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"        InitValue="Empty"  MaxLength="15"/>
</table>
<script>
PriPoolConfigFormList = HWGetLiIdListByForm("PriPoolConfigForm");
HWParsePageControlByID("PriPoolConfigForm", TableClass, dhcp2_language, null);
</script>
</form>

<div id="DhcpPoolPanel" style="display:none"> 
 <div class="func_spread"></div> 
 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="func_title"> 
<tr><td BindText="bbsp_pripoolsub"></td></tr></table> 

    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="tabal_noborder_bg"> 
      <tbody id='dhcpPoolInfo'> 
      <tr > 
        <td  class="table_title width_per25" BindText = 'bbsp_devtype'></td> 
        <td  class="table_right width_per15" BindText = 'bbsp_startip'></td> 
        <td  class="table_right width_per60" BindText = 'bbsp_endip'></td> 
      </tr> 
      <tr > 
        <td  class="table_title width_per25" BindText = 'bbsp_hgwmh'></td> 
<td  class="table_right width_per15"> <div align="left"> 
<input type='text' id='HGWEthStart' name='HGWEthStart' maxlength='15'>
</div></td> 
        <td  class="table_right width_per60"> <input type='text' id='HGWEthEnd' name='HGWEthEnd' maxlength='15'></td> 
      </tr> 
      <tr > 
        <td  class="table_title width_per25" BindText = 'bbsp_stbmh'></td> 
        <td  class="table_right width_per15"> <input type='text' id='STBEthStart' name='STBEthStart' maxlength='15'></td> 
        <td  class="table_right width_per60"> <input type='text' id='STBEthEnd' name='STBEthEnd' maxlength='15'></td> 
      </tr> 
      <tr> 
        <td  class="table_title width_per25" BindText = 'bbsp_cameramh'></td> 
        <td  class="table_right width_per15"> <input type='text' id='CameraEthStart' name='CameraEthStart' maxlength='15'></td> 
        <td  class="table_right width_per60"> <input type='text' id='CameraEthEnd' name='CameraEthEnd' maxlength='15'></td> 
      </tr> 
      <tr> 
        <td  class="table_title width_per25" BindText = 'bbsp_computermh'></td> 
        <td  class="table_right width_per15"> <input type='text' id='ComputerEthStart' name='ComputerEthStart' maxlength='15'></td> 
        <td  class="table_right width_per60"> <input type='text' id='ComputerEthEnd' name='ComputerEthEnd' maxlength='15'></td> 
      </tr> 
      <tr > 
        <td  class="table_title width_per25" BindText = 'bbsp_phonemh'></td> 
        <td  class="table_right width_per15"> <input type='text' id='PhoneEthStart' name='PhoneEthStart' maxlength='15'></td> 
        <td  class="table_right width_per60"> <input type='text' id='PhoneEthEnd' name='PhoneEthEnd' maxlength='15'></td> 
      </tr> 
      </tbody> 
    </table> 
</div> 
<script language="JavaScript" type="text/javascript">
if(SingtelMode == '1')
{
    document.write(" \<br\>  Note: For static IP address configuration, the value of the last octet must be within 64 - 127.");
}
</script>
<div id='SecondaryServerPool' style="display:none">
<div class="func_spread"></div>

<form id = "SecPoolConfigForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="func_title"> 
<tr>
<td id="SecPoolInfoBar">
<script>
if (conditionpoolfeature == '1')
{
document.write(dhcp2_language['bbsp_conpool']);
}
else
{
document.write(dhcp2_language['bbsp_secpool']);
}
</script>
</td>
</tr></table>  

<table border="0" cellpadding="0" cellspacing="1"  width="100%">
<li   id="DHCPEnable"        RealType="CheckBox"        DescRef="bbsp_enablesecvermh"        RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"  ClickFuncApp="onclick=enbleDHCP"/>
</table>
<script>
SecPoolConfigFormList = HWGetLiIdListByForm("SecPoolConfigForm", SecPoolReload);
HWParsePageControlByID("SecPoolConfigForm", TableClass, dhcp2_language, SecPoolReload);
if (conditionpoolfeature == '1')
{
document.getElementById("DHCPEnable").title = dhcp2_language['bbsp_dhcp_con_enable'];
}
else
{
document.getElementById("DHCPEnable").title = dhcp2_language['bbsp_dhcp_enable'];
}
</script>
</form>

<form id = "SlaveConfigForm" style="display:none">
<table border="0" cellpadding="0" cellspacing="1"  width="100%">
<li   id="SlaveIpAddr"          RealType="TextBox"          DescRef="bbsp_ipmh"          RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"/>
<li   id="SlaveMask"          RealType="TextBox"          DescRef="bbsp_maskmh"          RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"/>
<li   id="SlaveEthStart"          RealType="TextBox"            DescRef="bbsp_startipmh"          RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="TRUE"     BindField="Empty"   InitValue="Empty"  MaxLength="15"/>
<li   id="SlaveEthEnd"            RealType="TextBox"            DescRef="bbsp_endipmh"            RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="TRUE"     BindField="Empty"   InitValue="Empty"  MaxLength="15"/>
<li   id="SlaveLeasedTime"        RealType="TextOtherBox"       DescRef="bbsp_leasedmh"           RemarkRef="Empty"    ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   Elementclass="TextBox_2"    InitValue="[{Type:'select',Item:[{AttrName:'id',AttrValue:'dhcpLeasedTimeFrag'},{AttrName:'class',AttrValue:'Select_2'}]}]"/>
<li   id="dhcpOption60"           RealType="TextBox"            DescRef="bbsp_op60mh"             RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="TRUE"     BindField="Empty"   Elementclass="TextBoxLtr"  InitValue="Empty"  TitleRef="bbsp_60prnote"  MaxLength="256"/>
<li   id="Option60Mode"          RealType="DropDownList"      DescRef="bbsp_op60_modemh"        RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"/>
<li   id="dhcpOption43"           RealType="TextBox"            DescRef="bbsp_op43mh"             RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"   Elementclass="TextBoxLtr"   InitValue="Empty"  TitleRef="bbsp_option43prnote"  MaxLength="64"/>
<li   id="ntpserver"              RealType="TextBox"            DescRef="bbsp_ntpserver"          RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"   InitValue="Empty"  TitleRef="bbsp_ntpserverprnote"  MaxLength="64"/>
<li   id="dnsSecPri"             RealType="TextBox"            DescRef="bbsp_pridnsmh"            RemarkRef="Empty"    ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"        InitValue="Empty"  MaxLength="15"/>
<li   id="dnsSecSec"             RealType="TextBox"            DescRef="bbsp_secdnsmh"            RemarkRef="Empty"    ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"        InitValue="Empty"  MaxLength="15"/>
<li   id="dhcpOption240"         RealType="TextBox"            DescRef="bbsp_op240mh"             RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"     BindField="Empty"   Elementclass="TextBoxLtr"  InitValue="Empty"  MaxLength="522"/>
<li   id="OptionsEnable"         RealType="CheckBox"         DescRef="bbsp_enablOptions"        RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"    BindField="Empty"   InitValue="Empty"/>
</table>
<script>
SlaveConfigFormList = HWGetLiIdListByForm("SlaveConfigForm", SlaveCfgReload);
HWParsePageControlByID("SlaveConfigForm", TableClass, dhcp2_language, SlaveCfgReload);   
</script>
</form>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_button"> 
<tr> 
  <td class='width_per25'></td> 
  <td class="table_submit" > 
   <input type="hidden" name="onttoken" id="hwonttoken" value="02b15d8ccf13970d7a121d6100208131">
  <button id="btnApply_ex" name="btnApply_ex" type="button" class="ApplyButtoncss buttonwidth_100px" onClick="ApplyConfig();"><script>document.write(dhcp2_language['bbsp_app']);</script> </button> 
<button name="cancelValue_ex" id="cancelValue_ex" type="button" class="CancleButtonCss buttonwidth_100px" onClick="CancelConfig();"><script>document.write(dhcp2_language['bbsp_cancel']);</script> </button>  
</tr> 
</table> 
</div>
</div>
<div class="func_spread"></div>
<div id="MulitOptions" style="display:none">
<div class="func_spread"></div>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="func_title"> 
<tr>
<td>
<script>document.write(dhcp2_language["bbsp_enablOptions"]);</script>
</td>
</tr>
</table>
<script language="JavaScript" type="text/javascript">
var optionsConfiglistInfo = new Array(new stTableTileInfo("Empty","align_center width_per5","DomainBox"),
new stTableTileInfo("bbsp_op60","align_center width_per25","VendorClassID",false,25),
new stTableTileInfo("bbsp_MultiOption43","align_center width_per25 restrict_dir_ltr","X_HW_Option43",false,25),null);
var ColumnNum = optionsConfiglistInfo.length-1;
var ShowButtonFlag = true;
var DhcpStaticTableConfigInfoList = new Array();
var TableDataInfo = HWcloneObject(MoptionArray, 1);
TableDataInfo.push(null);
HWShowTableListByType(1, TableName, ShowButtonFlag, ColumnNum, TableDataInfo, optionsConfiglistInfo, dhcp2_language, null);
</script>
<form id = "OptionsForm" style="display:none">  
<table border="0" cellpadding="0" cellspacing="1"  width="100%">
<li   id="MultidhcpOption60"           RealType="TextBox"            DescRef="bbsp_op60mh"             RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="TRUE"     BindField="x.VendorClassID"   Elementclass="TextBoxLtr"  InitValue="Empty"  MaxLength="256"/>
<li   id="MultidhcpOption43"           RealType="TextBox"            DescRef="bbsp_op43mh"             RemarkRef="Empty"     ErrorMsgRef="Empty"    Require="FALSE"     BindField="x.X_HW_Option43"   Elementclass="TextBoxLtr"   InitValue="Empty"  MaxLength="64"/>
</table>
<script>
OptionsConfigFormList = HWGetLiIdListByForm("OptionsForm",null);
HWParsePageControlByID("OptionsForm", TableClass, dhcp2_language, null);
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_button"> 
<tr> 
  <td class='width_per25'></td> 
  <td class="table_submit" > 
  <button id="btnSubmit" name="btnSubmit" type="button" class="ApplyButtoncss buttonwidth_50px" onClick="SubmitOptions();"><script>document.write(dhcp2_language['bbsp_app']);</script> </button> 
<button name="CancelOptions" id="CancelOptions" type="button" class="CancleButtonCss buttonwidth_50px" onClick="CancelOption();"><script>document.write(dhcp2_language['bbsp_cancel']);</script> </button>  
</tr> 
</table> 
</form>
<br>
<br>
</div>
<script language="JavaScript" type="text/javascript">
InitLeasedTime();
InitOption60Mode();
getElById("DHCPEnableRow").title = dhcp2_language['bbsp_dhcp_enable'];
</script> 
</body>
</html>
