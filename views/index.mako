# -*- coding: utf-8 -*-
<%inherit file="layout.mako" />

<div id="doc" class="index">    

  <div id="bd"class="yui-t1">
    <div id="yui-main">
      <div class="yui-b">
    
          <h1>status-back</h1>
    
          <hr/>
          
          <p>status-back returns HTTP responses based on parameters. Its useful for testing error handling for HTTP response status codes, content-type, and content.</p>

          <hr/>

          <h2 id="source">Source</h2>
          On github: <a href="http://github.com/gabriel/status-back">gabriel/status-back</a></p>          
          <hr/>
          
          <h2 id="url_params">URL parameters</h2>
          
          <table id="url-params" class="tabular">
            <thead>
              <tr>
                <th>Parameter</th>
                <th>Description</th> 
                <th>Example</th>
              </tr>
            <tbody>
            <tr>
              <td>status</td> 
              <td>HTTP status code to return</td> 
              <td><a href="http://status-back.appspot.com/?status=503">http://status-back.appspot.com/?status=503</a></td>
            </tr>
            <tr>
              <td>content_type</td> 
              <td>Content-Type response header</td> 
              <td><a href="http://status-back.appspot.com/?status=200&content_type=application%2Fjson">http://status-back.appspot.com/?status=200&content_type=application%2Fjson</a></td>
            </tr>
            <tr>
              <td>content</td> 
              <td>Content for response</td> 
              <td><a href="http://status-back.appspot.com/?status=200">http://status-back.appspot.com/?status=200&content=OK</a></td>
            </tr>
            </tbody>
          </table>

          <hr/>
          <h2>Example</h2>
          <pre style="overflow:auto; width=380px">
curl -v "http://status-back.appspot.com/?status=200&content_type=application%2Fjson&content=%7B%20%22text%22%3A%20%22hi%22%20%7D"
* About to connect() to status-back.appspot.com port 80 (#0)
*   Trying 74.125.155.141... connected
* Connected to status-back.appspot.com (74.125.155.141) port 80 (#0)
> GET /?status=200&content_type=application%2Fjson&content=%7B%20%22text%22%3A%20%22hi%22%20%7D HTTP/1.1
> User-Agent: curl/7.19.7 (universal-apple-darwin10.0) libcurl/7.19.7 OpenSSL/0.9.8l zlib/1.2.3
> Host: status-back.appspot.com
> Accept: */*
> 
< HTTP/1.1 200 OK
< Cache-Control: no-cache
< Content-Type: application/json
< Expires: Fri, 01 Jan 1990 00:00:00 GMT
< Date: Fri, 09 Jul 2010 18:23:33 GMT
< Server: Google Frontend
< Transfer-Encoding: chunked
< 
* Connection #0 to host status-back.appspot.com left intact
* Closing connection #0
{ "text": "hi" }

</pre>

      </div>    
    </div>
    
  </div>  
  
</div>

