
var PageName = '路径信息查询-demo';
var PageId = 'p7c0b9de59f1143629b2950adb0e91ac2'
var PageUrl = '路径信息查询-demo.html'
document.title = '路径信息查询-demo';

if (top.location != self.location)
{
	if (parent.HandleMainFrameChanged) {
		parent.HandleMainFrameChanged();
	}
}

var $OnLoadVariable = '';

var $CSUM;

var hasQuery = false;
var query = window.location.hash.substring(1);
if (query.length > 0) hasQuery = true;
var vars = query.split("&");
for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split("=");
    if (pair[0].length > 0) eval("$" + pair[0] + " = decodeURIComponent(pair[1]);");
} 

if (hasQuery && $CSUM != 1) {
alert('Prototype Warning: Variable values were truncated.');
}

function GetQuerystring() {
    return '#OnLoadVariable=' + encodeURIComponent($OnLoadVariable) + '&CSUM=1';
}

function PopulateVariables(value) {
  value = value.replace(/\[\[OnLoadVariable\]\]/g, $OnLoadVariable);
  value = value.replace(/\[\[PageName\]\]/g, PageName);
  return value;
}

function OnLoad(e) {

}

eval(GetDynamicPanelScript('u36', 4));

eval(GetDynamicPanelScript('u147', 2));

eval(GetDynamicPanelScript('u72', 2));

eval(GetDynamicPanelScript('u266', 2));

eval(GetDynamicPanelScript('u41', 4));

eval(GetDynamicPanelScript('u46', 2));

var u33 = document.getElementById('u33');
gv_vAlignTable['u33'] = 'center';
var u402 = document.getElementById('u402');

u402.style.cursor = 'pointer';
if (bIE) u402.attachEvent("onclick", Clicku402);
else u402.addEventListener("click", Clicku402, true);
function Clicku402(e)
{

if (true) {

	SetPanelStateu36("pd0u36");

}

}
gv_vAlignTable['u402'] = 'top';
var u65 = document.getElementById('u65');
gv_vAlignTable['u65'] = 'center';
var u126 = document.getElementById('u126');
gv_vAlignTable['u126'] = 'top';
var u296 = document.getElementById('u296');
gv_vAlignTable['u296'] = 'top';
var u332 = document.getElementById('u332');
gv_vAlignTable['u332'] = 'center';
var u157 = document.getElementById('u157');

var u129 = document.getElementById('u129');

var u86 = document.getElementById('u86');
gv_vAlignTable['u86'] = 'top';
var u162 = document.getElementById('u162');

var u0 = document.getElementById('u0');

var u262 = document.getElementById('u262');

var u131 = document.getElementById('u131');
gv_vAlignTable['u131'] = 'top';
var u42 = document.getElementById('u42');

var u82 = document.getElementById('u82');

var u74 = document.getElementById('u74');
gv_vAlignTable['u74'] = 'center';
var u216 = document.getElementById('u216');
gv_vAlignTable['u216'] = 'center';
var u99 = document.getElementById('u99');
gv_vAlignTable['u99'] = 'center';
var u386 = document.getElementById('u386');

var u277 = document.getElementById('u277');
gv_vAlignTable['u277'] = 'center';
var u234 = document.getElementById('u234');
gv_vAlignTable['u234'] = 'top';
var u104 = document.getElementById('u104');
gv_vAlignTable['u104'] = 'center';
var u242 = document.getElementById('u242');

var u323 = document.getElementById('u323');

var u391 = document.getElementById('u391');
gv_vAlignTable['u391'] = 'top';
var u229 = document.getElementById('u229');

var u399 = document.getElementById('u399');
gv_vAlignTable['u399'] = 'top';
var u366 = document.getElementById('u366');

var u51 = document.getElementById('u51');

var u331 = document.getElementById('u331');

var u270 = document.getElementById('u270');
gv_vAlignTable['u270'] = 'top';
var u128 = document.getElementById('u128');

var u68 = document.getElementById('u68');

var u257 = document.getElementById('u257');
gv_vAlignTable['u257'] = 'top';
var u306 = document.getElementById('u306');
gv_vAlignTable['u306'] = 'top';
var u278 = document.getElementById('u278');
gv_vAlignTable['u278'] = 'top';
var u240 = document.getElementById('u240');
gv_vAlignTable['u240'] = 'top';
var u261 = document.getElementById('u261');
gv_vAlignTable['u261'] = 'center';
var u187 = document.getElementById('u187');
gv_vAlignTable['u187'] = 'top';
var u324 = document.getElementById('u324');
gv_vAlignTable['u324'] = 'center';
var u346 = document.getElementById('u346');
gv_vAlignTable['u346'] = 'center';
var u32 = document.getElementById('u32');

u32.style.cursor = 'pointer';
if (bIE) u32.attachEvent("onclick", Clicku32);
else u32.addEventListener("click", Clicku32, true);
function Clicku32(e)
{

if (((GetSelectedOption('u31')) == (PopulateVariables('西土城'))) && ((GetSelectedOption('u380')) == (PopulateVariables('前门')))) {

	SetPanelStateu36("pd1u36");

}
else
if (((GetSelectedOption('u31')) == (PopulateVariables('和平西桥'))) && ((GetSelectedOption('u380')) == (PopulateVariables('阜成门')))) {

	SetPanelStateu36("pd2u36");

}
else
if (((GetSelectedOption('u31')) == (PopulateVariables('五道口'))) && ((GetSelectedOption('u380')) == (PopulateVariables('森林公园南门')))) {

	SetPanelStateu36("pd3u36");

}

}

var u27 = document.getElementById('u27');

var u192 = document.getElementById('u192');
gv_vAlignTable['u192'] = 'top';
var u319 = document.getElementById('u319');
gv_vAlignTable['u319'] = 'top';
var u108 = document.getElementById('u108');

var u212 = document.getElementById('u212');
gv_vAlignTable['u212'] = 'top';
var u60 = document.getElementById('u60');
gv_vAlignTable['u60'] = 'top';
var u59 = document.getElementById('u59');

var u5 = document.getElementById('u5');

var u360 = document.getElementById('u360');
gv_vAlignTable['u360'] = 'top';
var u103 = document.getElementById('u103');

var u9 = document.getElementById('u9');

var u107 = document.getElementById('u107');
gv_vAlignTable['u107'] = 'top';
var u368 = document.getElementById('u368');
gv_vAlignTable['u368'] = 'top';
var u401 = document.getElementById('u401');
gv_vAlignTable['u401'] = 'center';
var u365 = document.getElementById('u365');
gv_vAlignTable['u365'] = 'top';
var u330 = document.getElementById('u330');
gv_vAlignTable['u330'] = 'top';
var u314 = document.getElementById('u314');

var u125 = document.getElementById('u125');
gv_vAlignTable['u125'] = 'top';
var u36 = document.getElementById('u36');

var u295 = document.getElementById('u295');
gv_vAlignTable['u295'] = 'top';
var u256 = document.getElementById('u256');
gv_vAlignTable['u256'] = 'top';
var u143 = document.getElementById('u143');

var u122 = document.getElementById('u122');
gv_vAlignTable['u122'] = 'center';
var u260 = document.getElementById('u260');

var u138 = document.getElementById('u138');
gv_vAlignTable['u138'] = 'top';
var u345 = document.getElementById('u345');

var u349 = document.getElementById('u349');
gv_vAlignTable['u349'] = 'top';
var u211 = document.getElementById('u211');
gv_vAlignTable['u211'] = 'top';
var u231 = document.getElementById('u231');

var u169 = document.getElementById('u169');
gv_vAlignTable['u169'] = 'top';
var u215 = document.getElementById('u215');

var u137 = document.getElementById('u137');
gv_vAlignTable['u137'] = 'top';
var u275 = document.getElementById('u275');
gv_vAlignTable['u275'] = 'center';
var u102 = document.getElementById('u102');
gv_vAlignTable['u102'] = 'top';
var u180 = document.getElementById('u180');

var u369 = document.getElementById('u369');
gv_vAlignTable['u369'] = 'top';
var u85 = document.getElementById('u85');
gv_vAlignTable['u85'] = 'top';
var u77 = document.getElementById('u77');
gv_vAlignTable['u77'] = 'top';
var u300 = document.getElementById('u300');
gv_vAlignTable['u300'] = 'center';
var u141 = document.getElementById('u141');

var u20 = document.getElementById('u20');

u20.style.cursor = 'pointer';
if (bIE) u20.attachEvent("onclick", Clicku20);
else u20.addEventListener("click", Clicku20, true);
function Clicku20(e)
{

if (true) {

	self.location.href="末班车衔接-demo.html" + GetQuerystring();

}

}
gv_vAlignTable['u20'] = 'top';
var u226 = document.getElementById('u226');
gv_vAlignTable['u226'] = 'center';
var u364 = document.getElementById('u364');
gv_vAlignTable['u364'] = 'top';
var u264 = document.getElementById('u264');
gv_vAlignTable['u264'] = 'top';
var u109 = document.getElementById('u109');

var u255 = document.getElementById('u255');
gv_vAlignTable['u255'] = 'top';
var u183 = document.getElementById('u183');

var u259 = document.getElementById('u259');
gv_vAlignTable['u259'] = 'center';
var u13 = document.getElementById('u13');

var u305 = document.getElementById('u305');
gv_vAlignTable['u305'] = 'top';
var u54 = document.getElementById('u54');
gv_vAlignTable['u54'] = 'top';
var u387 = document.getElementById('u387');

var u206 = document.getElementById('u206');

var u344 = document.getElementById('u344');
gv_vAlignTable['u344'] = 'top';
var u94 = document.getElementById('u94');
gv_vAlignTable['u94'] = 'top';
var u186 = document.getElementById('u186');
gv_vAlignTable['u186'] = 'top';
var u279 = document.getElementById('u279');
gv_vAlignTable['u279'] = 'top';
var u336 = document.getElementById('u336');
gv_vAlignTable['u336'] = 'top';
var u210 = document.getElementById('u210');
gv_vAlignTable['u210'] = 'top';
var u318 = document.getElementById('u318');
gv_vAlignTable['u318'] = 'center';
var u191 = document.getElementById('u191');
gv_vAlignTable['u191'] = 'center';
var u136 = document.getElementById('u136');
gv_vAlignTable['u136'] = 'top';
var u341 = document.getElementById('u341');
gv_vAlignTable['u341'] = 'top';
var u101 = document.getElementById('u101');
gv_vAlignTable['u101'] = 'top';
var u199 = document.getElementById('u199');
gv_vAlignTable['u199'] = 'center';
var u31 = document.getElementById('u31');

u31.style.cursor = 'pointer';
if (bIE) u31.attachEvent("onclick", Clicku31);
else u31.addEventListener("click", Clicku31, true);
function Clicku31(e)
{

if ((GetSelectedOption('u31')) == (PopulateVariables('西土城'))) {

SetSelectedOption('u380', PopulateVariables('前门'));

}
else
if ((GetSelectedOption('u31')) == (PopulateVariables('和平西桥'))) {

SetSelectedOption('u380', PopulateVariables('阜成门'));

}
else
if ((GetSelectedOption('u31')) == (PopulateVariables('五道口'))) {

SetSelectedOption('u380', PopulateVariables('森林公园南门'));

SetSelectedOption('u382', PopulateVariables('23'));

SetSelectedOption('u384', PopulateVariables('25'));

}

}

var u140 = document.getElementById('u140');
gv_vAlignTable['u140'] = 'center';
var u48 = document.getElementById('u48');
gv_vAlignTable['u48'] = 'center';
var u63 = document.getElementById('u63');

u63.style.cursor = 'pointer';
if (bIE) u63.attachEvent("onclick", Clicku63);
else u63.addEventListener("click", Clicku63, true);
function Clicku63(e)
{

if (true) {

	SetPanelStateu46("pd1u46");

}

}

var u106 = document.getElementById('u106');
gv_vAlignTable['u106'] = 'center';
var u88 = document.getElementById('u88');
gv_vAlignTable['u88'] = 'center';
var u400 = document.getElementById('u400');

u400.style.cursor = 'pointer';
if (bIE) u400.attachEvent("onclick", Clicku400);
else u400.addEventListener("click", Clicku400, true);
function Clicku400(e)
{

if (true) {

	SetPanelStateu36("pd0u36");

}

}

var u111 = document.getElementById('u111');
gv_vAlignTable['u111'] = 'top';
var u294 = document.getElementById('u294');
gv_vAlignTable['u294'] = 'top';
var u120 = document.getElementById('u120');

var u119 = document.getElementById('u119');
gv_vAlignTable['u119'] = 'top';
var u205 = document.getElementById('u205');
gv_vAlignTable['u205'] = 'center';
var u302 = document.getElementById('u302');

var u289 = document.getElementById('u289');
gv_vAlignTable['u289'] = 'top';
var u40 = document.getElementById('u40');
gv_vAlignTable['u40'] = 'center';
var u3 = document.getElementById('u3');

var u390 = document.getElementById('u390');

var u160 = document.getElementById('u160');
gv_vAlignTable['u160'] = 'top';
var u72 = document.getElementById('u72');

var u80 = document.getElementById('u80');

var u163 = document.getElementById('u163');
gv_vAlignTable['u163'] = 'center';
var u281 = document.getElementById('u281');

var u168 = document.getElementById('u168');
gv_vAlignTable['u168'] = 'center';
var u227 = document.getElementById('u227');
gv_vAlignTable['u227'] = 'top';
var u96 = document.getElementById('u96');

var u384 = document.getElementById('u384');

var u16 = document.getElementById('u16');

var u362 = document.getElementById('u362');
gv_vAlignTable['u362'] = 'top';
var u232 = document.getElementById('u232');
gv_vAlignTable['u232'] = 'center';
var u12 = document.getElementById('u12');

var u333 = document.getElementById('u333');

var u209 = document.getElementById('u209');
gv_vAlignTable['u209'] = 'top';
var u276 = document.getElementById('u276');

var u154 = document.getElementById('u154');
gv_vAlignTable['u154'] = 'top';
var u334 = document.getElementById('u334');
gv_vAlignTable['u334'] = 'center';
var u282 = document.getElementById('u282');
gv_vAlignTable['u282'] = 'center';
var u377 = document.getElementById('u377');
gv_vAlignTable['u377'] = 'top';
var u258 = document.getElementById('u258');

var u342 = document.getElementById('u342');

var u317 = document.getElementById('u317');

var u139 = document.getElementById('u139');

var u25 = document.getElementById('u25');

var u284 = document.getElementById('u284');
gv_vAlignTable['u284'] = 'top';
var u179 = document.getElementById('u179');
gv_vAlignTable['u179'] = 'center';
var u185 = document.getElementById('u185');

var u335 = document.getElementById('u335');
gv_vAlignTable['u335'] = 'top';
var u57 = document.getElementById('u57');

var u134 = document.getElementById('u134');
gv_vAlignTable['u134'] = 'top';
var u92 = document.getElementById('u92');

var u228 = document.getElementById('u228');
gv_vAlignTable['u228'] = 'top';
var u97 = document.getElementById('u97');
gv_vAlignTable['u97'] = 'center';
var u190 = document.getElementById('u190');

var u353 = document.getElementById('u353');
gv_vAlignTable['u353'] = 'center';
var u37 = document.getElementById('u37');

var u198 = document.getElementById('u198');

var u348 = document.getElementById('u348');
gv_vAlignTable['u348'] = 'center';
var u253 = document.getElementById('u253');
gv_vAlignTable['u253'] = 'top';
var u19 = document.getElementById('u19');

u19.style.cursor = 'pointer';
if (bIE) u19.attachEvent("onclick", Clicku19);
else u19.addEventListener("click", Clicku19, true);
function Clicku19(e)
{

if (true) {

	self.location.href="默认首班车衔接页面-demo.html" + GetQuerystring();

}

}
gv_vAlignTable['u19'] = 'top';
var u208 = document.getElementById('u208');
gv_vAlignTable['u208'] = 'top';
var u34 = document.getElementById('u34');

u34.style.cursor = 'pointer';
if (bIE) u34.attachEvent("onclick", Clicku34);
else u34.addEventListener("click", Clicku34, true);
function Clicku34(e)
{

if (((GetSelectedOption('u31')) == (PopulateVariables('西土城'))) && ((GetSelectedOption('u380')) == (PopulateVariables('前门')))) {

	SetPanelStateu36("pd1u36");

}
else
if (((GetSelectedOption('u31')) == (PopulateVariables('和平西桥'))) && ((GetSelectedOption('u380')) == (PopulateVariables('阜成门')))) {

	SetPanelStateu36("pd2u36");

}
else
if (((GetSelectedOption('u31')) == (PopulateVariables('五道口'))) && ((GetSelectedOption('u380')) == (PopulateVariables('森林公园南门')))) {

	SetPanelStateu36("pd3u36");

}

}
gv_vAlignTable['u34'] = 'top';
var u153 = document.getElementById('u153');
gv_vAlignTable['u153'] = 'top';
var u66 = document.getElementById('u66');

var u123 = document.getElementById('u123');

var u376 = document.getElementById('u376');
gv_vAlignTable['u376'] = 'top';
var u280 = document.getElementById('u280');
gv_vAlignTable['u280'] = 'top';
var u118 = document.getElementById('u118');
gv_vAlignTable['u118'] = 'top';
var u167 = document.getElementById('u167');

var u288 = document.getElementById('u288');
gv_vAlignTable['u288'] = 'top';
var u11 = document.getElementById('u11');

var u28 = document.getElementById('u28');
gv_vAlignTable['u28'] = 'center';
var u356 = document.getElementById('u356');

var u43 = document.getElementById('u43');
gv_vAlignTable['u43'] = 'center';
var u75 = document.getElementById('u75');
gv_vAlignTable['u75'] = 'top';
var u83 = document.getElementById('u83');
gv_vAlignTable['u83'] = 'center';
var u222 = document.getElementById('u222');
gv_vAlignTable['u222'] = 'top';
var u213 = document.getElementById('u213');

var u383 = document.getElementById('u383');
gv_vAlignTable['u383'] = 'top';
var u244 = document.getElementById('u244');
gv_vAlignTable['u244'] = 'top';
var u311 = document.getElementById('u311');
gv_vAlignTable['u311'] = 'top';
var u152 = document.getElementById('u152');
gv_vAlignTable['u152'] = 'top';
var u239 = document.getElementById('u239');
gv_vAlignTable['u239'] = 'center';
var u237 = document.getElementById('u237');
gv_vAlignTable['u237'] = 'center';
var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u202 = document.getElementById('u202');
gv_vAlignTable['u202'] = 'top';
var u52 = document.getElementById('u52');
gv_vAlignTable['u52'] = 'top';
var u69 = document.getElementById('u69');
gv_vAlignTable['u69'] = 'center';
var u316 = document.getElementById('u316');
gv_vAlignTable['u316'] = 'center';
var u30 = document.getElementById('u30');
gv_vAlignTable['u30'] = 'top';
var u326 = document.getElementById('u326');
gv_vAlignTable['u326'] = 'center';
var u246 = document.getElementById('u246');
gv_vAlignTable['u246'] = 'top';
var u194 = document.getElementById('u194');
gv_vAlignTable['u194'] = 'top';
var u132 = document.getElementById('u132');
gv_vAlignTable['u132'] = 'top';
var u184 = document.getElementById('u184');

var u347 = document.getElementById('u347');

var u195 = document.getElementById('u195');

var u355 = document.getElementById('u355');

var u23 = document.getElementById('u23');

u23.style.cursor = 'pointer';
if (bIE) u23.attachEvent("onclick", Clicku23);
else u23.addEventListener("click", Clicku23, true);
function Clicku23(e)
{

if (true) {

	self.location.href="换乘站运力匹配-demo.html" + GetQuerystring();

}

}
gv_vAlignTable['u23'] = 'top';
var u221 = document.getElementById('u221');
gv_vAlignTable['u221'] = 'center';
var u352 = document.getElementById('u352');

var u61 = document.getElementById('u61');

u61.style.cursor = 'pointer';
if (bIE) u61.attachEvent("onclick", Clicku61);
else u61.addEventListener("click", Clicku61, true);
function Clicku61(e)
{

if (true) {

}

}
gv_vAlignTable['u61'] = 'top';
var u293 = document.getElementById('u293');
gv_vAlignTable['u293'] = 'center';
var u370 = document.getElementById('u370');
gv_vAlignTable['u370'] = 'top';
var u283 = document.getElementById('u283');
gv_vAlignTable['u283'] = 'top';
var u78 = document.getElementById('u78');
gv_vAlignTable['u78'] = 'top';
var u310 = document.getElementById('u310');
gv_vAlignTable['u310'] = 'center';
var u151 = document.getElementById('u151');
gv_vAlignTable['u151'] = 'top';
var u117 = document.getElementById('u117');
gv_vAlignTable['u117'] = 'top';
var u378 = document.getElementById('u378');
gv_vAlignTable['u378'] = 'top';
var u21 = document.getElementById('u21');

u21.style.cursor = 'pointer';
if (bIE) u21.attachEvent("onclick", Clicku21);
else u21.addEventListener("click", Clicku21, true);
function Clicku21(e)
{

if (true) {

	self.location.href="常规时间查询-demo.html" + GetQuerystring();

}

}
gv_vAlignTable['u21'] = 'top';
var u236 = document.getElementById('u236');

var u374 = document.getElementById('u374');
gv_vAlignTable['u374'] = 'top';
var u201 = document.getElementById('u201');
gv_vAlignTable['u201'] = 'top';
var u135 = document.getElementById('u135');
gv_vAlignTable['u135'] = 'top';
var u127 = document.getElementById('u127');
gv_vAlignTable['u127'] = 'top';
var u292 = document.getElementById('u292');

var u325 = document.getElementById('u325');

var u166 = document.getElementById('u166');
gv_vAlignTable['u166'] = 'top';
var u70 = document.getElementById('u70');
gv_vAlignTable['u70'] = 'top';
var u6 = document.getElementById('u6');
gv_vAlignTable['u6'] = 'center';
var u397 = document.getElementById('u397');
gv_vAlignTable['u397'] = 'top';
var u171 = document.getElementById('u171');

var u113 = document.getElementById('u113');
gv_vAlignTable['u113'] = 'top';
var u207 = document.getElementById('u207');
gv_vAlignTable['u207'] = 'center';
var u220 = document.getElementById('u220');

var u14 = document.getElementById('u14');

var u146 = document.getElementById('u146');
gv_vAlignTable['u146'] = 'top';
var u225 = document.getElementById('u225');

var u46 = document.getElementById('u46');

var u382 = document.getElementById('u382');

var u150 = document.getElementById('u150');
gv_vAlignTable['u150'] = 'top';
var u230 = document.getElementById('u230');
gv_vAlignTable['u230'] = 'center';
var u39 = document.getElementById('u39');

var u373 = document.getElementById('u373');
gv_vAlignTable['u373'] = 'center';
var u329 = document.getElementById('u329');
gv_vAlignTable['u329'] = 'top';
var u238 = document.getElementById('u238');

var u165 = document.getElementById('u165');
gv_vAlignTable['u165'] = 'top';
var u269 = document.getElementById('u269');
gv_vAlignTable['u269'] = 'top';
var u130 = document.getElementById('u130');
gv_vAlignTable['u130'] = 'center';
var u315 = document.getElementById('u315');

var u55 = document.getElementById('u55');
gv_vAlignTable['u55'] = 'top';
var u95 = document.getElementById('u95');
gv_vAlignTable['u95'] = 'top';
var u196 = document.getElementById('u196');

var u254 = document.getElementById('u254');
gv_vAlignTable['u254'] = 'top';
var u320 = document.getElementById('u320');
gv_vAlignTable['u320'] = 'top';
var u337 = document.getElementById('u337');
gv_vAlignTable['u337'] = 'top';
var u304 = document.getElementById('u304');

var u145 = document.getElementById('u145');
gv_vAlignTable['u145'] = 'top';
var u351 = document.getElementById('u351');
gv_vAlignTable['u351'] = 'center';
var u359 = document.getElementById('u359');
gv_vAlignTable['u359'] = 'top';
var u375 = document.getElementById('u375');
gv_vAlignTable['u375'] = 'top';
var u105 = document.getElementById('u105');

var u372 = document.getElementById('u372');

var u64 = document.getElementById('u64');

var u328 = document.getElementById('u328');
gv_vAlignTable['u328'] = 'top';
var u116 = document.getElementById('u116');
gv_vAlignTable['u116'] = 'center';
var u89 = document.getElementById('u89');
gv_vAlignTable['u89'] = 'top';
var u100 = document.getElementById('u100');
gv_vAlignTable['u100'] = 'top';
var u286 = document.getElementById('u286');

var u385 = document.getElementById('u385');
gv_vAlignTable['u385'] = 'top';
var u147 = document.getElementById('u147');

var u291 = document.getElementById('u291');
gv_vAlignTable['u291'] = 'center';
var u395 = document.getElementById('u395');
gv_vAlignTable['u395'] = 'top';
var u214 = document.getElementById('u214');
gv_vAlignTable['u214'] = 'center';
var u308 = document.getElementById('u308');
gv_vAlignTable['u308'] = 'top';
var u149 = document.getElementById('u149');
gv_vAlignTable['u149'] = 'center';
var u299 = document.getElementById('u299');

var u41 = document.getElementById('u41');

var u170 = document.getElementById('u170');
gv_vAlignTable['u170'] = 'top';
var u58 = document.getElementById('u58');
gv_vAlignTable['u58'] = 'top';
var u45 = document.getElementById('u45');
gv_vAlignTable['u45'] = 'center';
var u73 = document.getElementById('u73');

var u303 = document.getElementById('u303');

var u144 = document.getElementById('u144');
gv_vAlignTable['u144'] = 'center';
var u98 = document.getElementById('u98');

var u178 = document.getElementById('u178');

var u224 = document.getElementById('u224');
gv_vAlignTable['u224'] = 'top';
var u393 = document.getElementById('u393');
gv_vAlignTable['u393'] = 'top';
var u381 = document.getElementById('u381');
gv_vAlignTable['u381'] = 'top';
var u233 = document.getElementById('u233');
gv_vAlignTable['u233'] = 'top';
var u371 = document.getElementById('u371');

var u219 = document.getElementById('u219');
gv_vAlignTable['u219'] = 'top';
var u389 = document.getElementById('u389');
gv_vAlignTable['u389'] = 'top';
var u50 = document.getElementById('u50');

var u4 = document.getElementById('u4');

var u273 = document.getElementById('u273');
gv_vAlignTable['u273'] = 'top';
var u322 = document.getElementById('u322');

var u90 = document.getElementById('u90');
gv_vAlignTable['u90'] = 'top';
var u8 = document.getElementById('u8');

var u394 = document.getElementById('u394');

var u268 = document.getElementById('u268');
gv_vAlignTable['u268'] = 'center';
var u327 = document.getElementById('u327');
gv_vAlignTable['u327'] = 'top';
var u252 = document.getElementById('u252');
gv_vAlignTable['u252'] = 'top';
var u26 = document.getElementById('u26');
gv_vAlignTable['u26'] = 'center';
var u182 = document.getElementById('u182');
gv_vAlignTable['u182'] = 'top';
var u309 = document.getElementById('u309');

var u379 = document.getElementById('u379');
gv_vAlignTable['u379'] = 'top';
var u350 = document.getElementById('u350');

var u203 = document.getElementById('u203');

var u241 = document.getElementById('u241');

var u172 = document.getElementById('u172');
gv_vAlignTable['u172'] = 'center';
var u361 = document.getElementById('u361');
gv_vAlignTable['u361'] = 'top';
var u204 = document.getElementById('u204');

var u358 = document.getElementById('u358');
gv_vAlignTable['u358'] = 'top';
var u173 = document.getElementById('u173');

var u398 = document.getElementById('u398');

var u115 = document.getElementById('u115');

var u35 = document.getElementById('u35');

var u321 = document.getElementById('u321');
gv_vAlignTable['u321'] = 'top';
var u81 = document.getElementById('u81');
gv_vAlignTable['u81'] = 'center';
var u285 = document.getElementById('u285');
gv_vAlignTable['u285'] = 'top';
var u67 = document.getElementById('u67');
gv_vAlignTable['u67'] = 'center';
var u133 = document.getElementById('u133');
gv_vAlignTable['u133'] = 'top';
var u290 = document.getElementById('u290');

var u251 = document.getElementById('u251');
gv_vAlignTable['u251'] = 'top';
var u121 = document.getElementById('u121');

var u164 = document.getElementById('u164');
gv_vAlignTable['u164'] = 'top';
var u298 = document.getElementById('u298');
gv_vAlignTable['u298'] = 'center';
var u177 = document.getElementById('u177');
gv_vAlignTable['u177'] = 'top';
var u301 = document.getElementById('u301');
gv_vAlignTable['u301'] = 'top';
var u142 = document.getElementById('u142');
gv_vAlignTable['u142'] = 'center';
var u363 = document.getElementById('u363');
gv_vAlignTable['u363'] = 'top';
var u159 = document.getElementById('u159');
gv_vAlignTable['u159'] = 'top';
var u340 = document.getElementById('u340');
gv_vAlignTable['u340'] = 'top';
var u29 = document.getElementById('u29');
gv_vAlignTable['u29'] = 'top';
var u367 = document.getElementById('u367');
gv_vAlignTable['u367'] = 'center';
var u44 = document.getElementById('u44');

var u84 = document.getElementById('u84');
gv_vAlignTable['u84'] = 'top';
var u124 = document.getElementById('u124');
gv_vAlignTable['u124'] = 'center';
var u76 = document.getElementById('u76');
gv_vAlignTable['u76'] = 'top';
var u223 = document.getElementById('u223');
gv_vAlignTable['u223'] = 'top';
var u380 = document.getElementById('u380');

u380.style.cursor = 'pointer';
if (bIE) u380.attachEvent("onclick", Clicku380);
else u380.addEventListener("click", Clicku380, true);
function Clicku380(e)
{

if ((GetSelectedOption('u380')) == (PopulateVariables('前门'))) {

SetSelectedOption('u31', PopulateVariables('西土城'));

}
else
if ((GetSelectedOption('u380')) == (PopulateVariables('阜成门'))) {

SetSelectedOption('u31', PopulateVariables('和平西桥'));

}
else
if ((GetSelectedOption('u380')) == (PopulateVariables('森林公园南门'))) {

SetSelectedOption('u31', PopulateVariables('五道口'));

}

}

var u218 = document.getElementById('u218');
gv_vAlignTable['u218'] = 'top';
var u17 = document.getElementById('u17');

var u267 = document.getElementById('u267');

var u161 = document.getElementById('u161');
gv_vAlignTable['u161'] = 'top';
var u388 = document.getElementById('u388');
gv_vAlignTable['u388'] = 'center';
var u22 = document.getElementById('u22');

u22.style.cursor = 'pointer';
if (bIE) u22.attachEvent("onclick", Clicku22);
else u22.addEventListener("click", Clicku22, true);
function Clicku22(e)
{

if (true) {

	self.location.href="Resources/reload.html#" + encodeURI(PageUrl + GetQuerystring());

}

}
gv_vAlignTable['u22'] = 'top';
var u272 = document.getElementById('u272');
gv_vAlignTable['u272'] = 'top';
var u38 = document.getElementById('u38');
gv_vAlignTable['u38'] = 'center';
var u112 = document.getElementById('u112');
gv_vAlignTable['u112'] = 'top';
var u53 = document.getElementById('u53');

var u250 = document.getElementById('u250');
gv_vAlignTable['u250'] = 'top';
var u49 = document.getElementById('u49');
gv_vAlignTable['u49'] = 'top';
var u93 = document.getElementById('u93');
gv_vAlignTable['u93'] = 'center';
var u313 = document.getElementById('u313');
gv_vAlignTable['u313'] = 'top';
var u181 = document.getElementById('u181');
gv_vAlignTable['u181'] = 'center';
var u357 = document.getElementById('u357');

var u265 = document.getElementById('u265');
gv_vAlignTable['u265'] = 'top';
var u189 = document.getElementById('u189');
gv_vAlignTable['u189'] = 'top';
var u339 = document.getElementById('u339');
gv_vAlignTable['u339'] = 'center';
var u2 = document.getElementById('u2');
gv_vAlignTable['u2'] = 'top';
var u156 = document.getElementById('u156');
gv_vAlignTable['u156'] = 'center';
var u62 = document.getElementById('u62');

u62.style.cursor = 'pointer';
if (bIE) u62.attachEvent("onclick", Clicku62);
else u62.addEventListener("click", Clicku62, true);
function Clicku62(e)
{

if (true) {

	SetPanelStateu46("pd0u46");

}

}
gv_vAlignTable['u62'] = 'top';
var u354 = document.getElementById('u354');
gv_vAlignTable['u354'] = 'top';
var u79 = document.getElementById('u79');
gv_vAlignTable['u79'] = 'top';
var u243 = document.getElementById('u243');

var u114 = document.getElementById('u114');
gv_vAlignTable['u114'] = 'top';
var u245 = document.getElementById('u245');
gv_vAlignTable['u245'] = 'top';
var u297 = document.getElementById('u297');

var u247 = document.getElementById('u247');
gv_vAlignTable['u247'] = 'top';
var u148 = document.getElementById('u148');

var u274 = document.getElementById('u274');

var u175 = document.getElementById('u175');
gv_vAlignTable['u175'] = 'top';
var u176 = document.getElementById('u176');
gv_vAlignTable['u176'] = 'top';
var u71 = document.getElementById('u71');
gv_vAlignTable['u71'] = 'top';
var u200 = document.getElementById('u200');
gv_vAlignTable['u200'] = 'top';
var u396 = document.getElementById('u396');

var u10 = document.getElementById('u10');

var u158 = document.getElementById('u158');
gv_vAlignTable['u158'] = 'center';
var u217 = document.getElementById('u217');
gv_vAlignTable['u217'] = 'top';
var u15 = document.getElementById('u15');

var u155 = document.getElementById('u155');

var u249 = document.getElementById('u249');
gv_vAlignTable['u249'] = 'top';
var u235 = document.getElementById('u235');
gv_vAlignTable['u235'] = 'top';
var u47 = document.getElementById('u47');

var u392 = document.getElementById('u392');

var u287 = document.getElementById('u287');
gv_vAlignTable['u287'] = 'center';
var u87 = document.getElementById('u87');

var u266 = document.getElementById('u266');

var u91 = document.getElementById('u91');
gv_vAlignTable['u91'] = 'top';
var u7 = document.getElementById('u7');

var u110 = document.getElementById('u110');

var u271 = document.getElementById('u271');
gv_vAlignTable['u271'] = 'top';
var u307 = document.getElementById('u307');
gv_vAlignTable['u307'] = 'top';
var u174 = document.getElementById('u174');
gv_vAlignTable['u174'] = 'center';
var u24 = document.getElementById('u24');

u24.style.cursor = 'pointer';
if (bIE) u24.attachEvent("onclick", Clicku24);
else u24.addEventListener("click", Clicku24, true);
function Clicku24(e)
{

if (true) {

	self.location.href="车站间隔时间-demo.html" + GetQuerystring();

}

}
gv_vAlignTable['u24'] = 'top';
var u312 = document.getElementById('u312');
gv_vAlignTable['u312'] = 'top';
var u56 = document.getElementById('u56');

var u263 = document.getElementById('u263');
gv_vAlignTable['u263'] = 'center';
var u193 = document.getElementById('u193');
gv_vAlignTable['u193'] = 'top';
var u343 = document.getElementById('u343');
gv_vAlignTable['u343'] = 'center';
var u197 = document.getElementById('u197');
gv_vAlignTable['u197'] = 'center';
var u188 = document.getElementById('u188');
gv_vAlignTable['u188'] = 'top';
var u248 = document.getElementById('u248');

var u338 = document.getElementById('u338');

var u18 = document.getElementById('u18');

if (window.OnLoad) OnLoad();
