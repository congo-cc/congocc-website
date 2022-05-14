	<!-- Fixed-top navbar : see https://getbootstrap.com/docs/5.1/components/navbar/  -->
    <div class="navbar fixed-top navbar-expand-lg navbar-light bg-light" role="navigation">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">CongoCC</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>about.html">About</a>
            </li>
            <!-- Turn off RSS Subscribe menu option for now
            <li class="nav-item">
              <a class="nav-link active" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.feed_file}">Subscribe</a>
            </li>
            -->
            <!-- Turn off Dropdown menu option for now
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
                <li><hr class="dropdown-divider"></li>
                <li class="dropdown-header">Separated Header</li>
                <li><a class="dropdown-item" href="#">Separated link</a></li>
                <li><a class="dropdown-item" href="#">One more separated link</a></li>
              </ul>
            </li>
            -->
            <li class="nav-item">
              <a class="nav-link active" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>archive.html">Archive</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="https://discuss.congocc.org/">Discussion Forum</a>
            </li>
            <!-- Turn off disabled menu option for now
            <li class="nav-item">
              <a class="nav-link disabled">Disabled</a>
            </li>
            -->
          </ul>
        </div>
      </div>
    </div>
    <div class="container">