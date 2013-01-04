<!DOCTYPE html>
<html>
<head>
	<title>{$L.title}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="{$L.meta_description}" />
	<meta name="keywords" content="{$L.meta_keywords}" />
	<link rel="stylesheet" type="text/css" href="resources/themes/{$theme}/compiled/styles.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/smoothness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/chosen/chosen.css" />
	<link rel="stylesheet" type="text/css" href="resources/libs/codemirror/lib/codemirror.css" />
	<script src="resources/libs/codemirror/lib/codemirror.js"></script>
	<script src="resources/scripts/libs/jquery.js"></script>
	<script src="resources/scripts/libs/chosen.jquery.min.js"></script>
	<script src="resources/scripts/libs/require.js"></script>
	<script src="resources/scripts/requireConfig.js"></script>
	<!--[if lt IE 9]>
	<script src="resources/scripts/libs/html5shiv.js"></script>
	<script src="resources/scripts/libs/excanvas.js"></script>
	<![endif]-->
	<script type="text/javascript" src="resources/scripts/libs/spinners.js"></script>
	{$cssIncludes}
	{$codeMirrorIncludes}
</head>
<body>
	<header>
		<nav>
			{if $settings.userAccountSetup != "anonymous"}<a href="#" id="gdUserAccountLink">Your Account</a> |{/if}
			<a href="http://www.generatedata.com">{$L.website}</a> |
			<a href="http://www.benjaminkeen.com/category/projects/data-generator/">{$L.blog}</a> |
			{language_dropdown nameId="gdSelectLanguage" disabled=true}
		</nav>
	</header>
	<nav id="gdMainTabs" class="gdHideNoJS">
		<span id="gdDataSetStatusLine"></span>
		<span id="gdProcessingIcon"></span>
		<ul>
			<li id="gdMainTab1" class="gdSelected">{$L.generate}</li>
			{if $settings.userAccountSetup == "multiple"}<li id="gdMainTab2">{$L.accounts}</li>{/if}
			<li id="gdMainTab3">{$L.settings}</li>
			<li id="gdMainTab4">{$L.about}</li>
		</ul>
	</nav>
	<noscript><p>{$L.no_js}</p></noscript>
	<section class="gdHideNoJS">
		<div id="gdContent">
			<ul class="gdMainTabContent">
				<li id="gdMainTab1Content">{include file="generate.tab1.tpl"}</li>
				{if $settings.userAccountSetup == "multiple"}<li id="gdMainTab2Content" style="display:none">{include file="generate.tab2.tpl"}</li>{/if}
				<li id="gdMainTab3Content" style="display:none">{include file="generate.tab3.tpl"}</li>
				<li id="gdMainTab4Content" style="display:none">{include file="generate.tab4.tpl"}</li>
			</ul>
		</div>
	</section>

	{include file="footer.tpl"}

	<script>
	require([
		"manager",
		"generator",
		{$exportTypeJSModules},
		{$dataTypeJSModules},
		"pageinit"
	], function(manager) { manager.start(); });
	</script>

</body>
</html>