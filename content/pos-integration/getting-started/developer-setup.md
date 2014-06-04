---
title: "Developer Setup"
navigation: 2
---
### Obtaining an API key

Before beginning development on a point-of-sale integration, you must obtain a unique API key from
LevelUp. This will uniquely identify you or your organization as a developer with LevelUp and should
be kept private. You can obtain an API key by filling out the [LevelUp API Key Request Form](/getting-started/sign-up/).

### Development Environment Suggestions

You can develop a LevelUp integration within most any environment.

For POS systems running on Windows, we recommend developing POS integrations using C# with the
latest version of .NET where possible. In addition to the standard .NET libraries, we suggest using
<a href="http://restsharp.org/" target="_blank">RestSharp</a> and <a
href="http://james.newtonking.com/projects/json-net.aspx" target="_blank">Json.NET</a> both of which
are available through <a href="http://www.nuget.org/" target="_blank">NuGet package manager</a> in
Visual Studio.

For just trying out the LevelUp API and seeing what gets sent back and forth, we recommend using <a
href="http://curl.haxx.se/" target="_blank">cURL</a> to format your REST calls.
