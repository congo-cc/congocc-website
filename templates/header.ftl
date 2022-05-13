<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <title><#if (content.title)??>${content.title}<#else>CongoCC</#if></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="generator" content="JBake">

    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/bootstrap.min.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/asciidoctor.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/base.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/myjbake.css" rel="stylesheet">
    <style>
      body {
        font-size: 16px;
      }
      .divider-h3 {
          padding-bottom: 20px;
          border-bottom: 3px solid #bbb;
      }
    </style>

    <!-- Fav and touch icons and manifest for android -->
    <!-- from https://evilmartians.com/chronicles/how-to-favicon-in-2021-six-files-that-fit-most-needs -->
    <link rel="manifest" href="/manifest.webmanifest">
    <link rel="icon" href="/favicon.png" sizes="any"> 
    <link rel="icon" href="/icon.svg" type="image/svg+xml"> 
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">

  </head>
  <body>
    <div id="wrap">
   