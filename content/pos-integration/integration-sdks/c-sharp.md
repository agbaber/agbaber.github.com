---
title: "Getting Started: C# & .NET"
navigation: 3
---

## Overview
The <a href="https://github.com/TheLevelUp/levelup-integration-sdk-csharp/releases"
target="_blank">LevelUp Integration SDK</a> provides the basic building blocks you'll need to integrate LevelUp into
a point-of-sale system or other merchant-oriented app. Specifically, the SDK provides classes and
libraries which allow you to make requests to the LevelUp web service and handle the results. The
SDK doesn't mandate using any UI framework in particular.

NOTE: There are several links on this page that should take you to our GitHub repository where the
integration SDK is published. However, the SDK is still in limited preview as of this writing and
you will need to be granted access before being able to follow some of the links in this section. If
any of the links in this section appear to be broken for you, please ensure that you [request access](/getting-started/sign-up/)
 to the point-of-sale integration SDK.

While the SDK itself doesn't contain UI components, we don't want to leave you completely in the
cold. The <a href="https://github.com/TheLevelUp/levelup-integration-sdk-csharp/releases"
target="_blank">example app</a> provides a bare-bones implementation of a UI built in
<a href="http://msdn.microsoft.com/en-us/library/vstudio/ms754130.aspx" target="_blank">WPF</a> on top of the LevelUp SDK.

## Requirements
The LevelUp SDK is designed to work with the .NET 3.0 platform and was built using Visual Studio's
build system. The SDK depends on the <a href="http://restsharp.org/" target="_blank">RestSharp</a>
and <a href="ttp://james.newtonking.com/projects/json-net.aspx" target="_blank">Json.NET</a>
libraries, which are included in the `bin` folders as `.dll` files.

The LevelUp SDK example app depends on the SDK library. Instructions on setting up and building
the example app source code are provided in the installation section.

### API key
To use the LevelUp SDK, you will need to first [request a LevelUp API key](/getting-started/sign-up/).

## Installation
To get a good feel for how to use the SDK, first download the example app source code from the
<a href="https://github.com/TheLevelUp/levelup-integration-sdk-csharp/releases" target="_blank">releases page</a>. This will walk you through the basics for authentication,
merchant configuration, placing an order, and requesting a refund.

It is recommended to get the latest SDK version by way of Git. If you're unfamiliar with Git, please
see the <a href="https://help.github.com/" target="_blank">GitHub Getting Started Guide</a>.

### Getting the SDK
Our <a href="https://github.com/TheLevelUp/levelup-integration-sdk-csharp" target="_blank">GitHub
repository</a> <a href="https://github.com/TheLevelUp/levelup-integration-sdk-csharp/releases"
target="_blank">releases page</a> contains everything you need to get up and running. We recommend
that you download the <a href="https://github.com/TheLevelUp/levelup-integration-sdk-csharp/releases" target="_blank">example app source code and the compiled libraries</a>
which you would need to reference in your own app if you wanted to make use of them. We have also
included the source code for the SDK if you would like to make your own adjustments or just see
what is going on behind the scenes.

Before any requests can be made, you need to set your own API key as a constant in your source code
(or via a resources file) as described below.

### Building the Sample with Visual Studio
Open Visual Studio and go to `File --> Open --> Project/Solution`. Then select both the example app
`ConfigurationTool.csproj` file in the `ExampleApp` folder from the source code `.zip`
folder. You will need to re-add the references to the LevelUpApi and Newtonsoft.Json libraries which
can be obtained from the built SDK binaries `.zip` folders on the <a
href="https://github.com/TheLevelUp/levelup-integration-sdk-csharp/releases"
target="_blank">releases page</a>. Once those references are added, you should be able to build
successfully.

Once built, you should open the LevelUpTabItem.xaml.cs file and put your own API key here

```c#
	private const string CLIENT_ID = "LevelUp API key goes here";  //TODO: Set your API key here
```

where it says, "LevelUp API key goes here".

You should now be able to run the `ConfigurationTool` app successfully.
