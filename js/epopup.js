/* Functions to expand and contract text in <div> blocks with an id */

function ExpandOn(topicID){
var expand=document.getElementById(topicID);
if(!expand)return true;
if(expand.style.display=="none"){
expand.style.display="block"
} 
return true;
}

function ExpandOff(topicID){
var expand=document.getElementById(topicID);
if(!expand)return true;
if(expand.style.display=="block"){
expand.style.display="none"
}
return true;
} 

function ExpandToggle(topicID){
var expand=document.getElementById(topicID);
if(!expand)return true;
if(expand.style.display=="none"){
expand.style.display="block"
} else {
expand.style.display="none"
}
return true;
}