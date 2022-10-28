/*
 * jQuery UI Touch Punch 0.2.3
 *
 * Copyright 2011–2014, Dave Furfero
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Depends:
 *  jquery.ui.widget.js
 *  jquery.ui.mouse.js
 */
!function(g){function l(e,f){if(!(e.originalEvent.touches.length>1)){e.preventDefault();var m=e.originalEvent.changedTouches[0],n=document.createEvent("MouseEvents");n.initMouseEvent(f,!0,!0,window,1,m.screenX,m.screenY,m.clientX,m.clientY,!1,!1,!1,!1,0,null),e.target.dispatchEvent(n)}}if(g.support.touch="ontouchend" in document,g.support.touch){var k,h=g.ui.mouse.prototype,i=h._mouseInit,j=h._mouseDestroy;h._touchStart=function(c){var d=this;!k&&d._mouseCapture(c.originalEvent.changedTouches[0])&&(k=!0,d._touchMoved=!1,l(c,"mouseover"),l(c,"mousemove"),l(c,"mousedown"))},h._touchMove=function(b){k&&(this._touchMoved=!0,l(b,"mousemove"))},h._touchEnd=function(b){k&&(l(b,"mouseup"),l(b,"mouseout"),this._touchMoved||l(b,"click"),k=!1)},h._mouseInit=function(){var a=this;a.element.bind({touchstart:g.proxy(a,"_touchStart"),touchmove:g.proxy(a,"_touchMove"),touchend:g.proxy(a,"_touchEnd")}),i.call(a)},h._mouseDestroy=function(){var a=this;a.element.unbind({touchstart:g.proxy(a,"_touchStart"),touchmove:g.proxy(a,"_touchMove"),touchend:g.proxy(a,"_touchEnd")}),j.call(a)}}}(jQuery);