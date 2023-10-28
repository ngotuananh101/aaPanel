# aaPanel
Custom aaPanel docker image
<h1>aaPanel Docker Deployment</h1>
<p>Docker image customized by ngotuananh2101 (Jan21st)</p>
<p>The x86_64 architecture platform is now available for download</p>
<p>Maintained by: <a href="https://github.com/ngotuananh101">ngotuananh2101</a></p>
<p><code>latest</code> tag means that the panel is installed but the base lib is not installed, and the installation of the first software will be slower</p>

<h1>How to use</h1>
<p>
   <code>
      docker run -d -p 7800:7800 -p 2222:22 -p 2121:21 -p 443:443 -p 80:80 -p 888:888  jan21st/aapanel:latest
   </code>
</p>
<p>Now you can access aaPanel at <a href="http://yourip:7800">http://yourip:7800</a> from your host system.</p>
<p>Default installation entry:<code>aapanel</code></p>
<p>Default username:<code>aapanel</code></p>
<p>Default password:<code>aapanel123</code></p>
<p>Default root password:<code>root</code></p>

<h2>How to custom above value</h2>
<p>Set value in your <code>ENV</code> file to custom</p>
<p>Tnstallation entry<code>PANEL_PATH</code></p>
<p>Username:<code>PANEL_USER</code></p>
<p>Password:<code>PANEL_PASS</code></p>
<p>Root password:<code>LINUX_ROOT_PASS</code></p>

<h4>Port usage analysis</h4>
<p>Control Panel: <code>7800</code></p>
<p>phpMyAdmin: <code>888</code></p>

<h4>Dir usage analysis</h4>
<p>Website data: <code>/www/wwwroot</code></p>
<p>Mysql data: <code>/www/server/data</code></p>
<p>Vhost file: <code>/www/server/panel/vhost</code></p>

<h4>Note: after the deployment is complete, please immediately modify the user name and password in the panel settings and add the installation entry</h4>