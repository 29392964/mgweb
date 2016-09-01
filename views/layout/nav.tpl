<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Mgweb</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav">
        <!--
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DB <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" class="sdb">{{.db}}</a></li>
          </ul>
        </li>
        -->
        <li><a href="#" class="sdb">[DB:{{.db}}]</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Collection <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            {{range $index, $elem := .Collections}}
            <li><a href="#" class="sc">{{$elem}}</a></li>
            {{end}}
          </ul>
        </li>
        {{if .Editable}}
        <li class="pull-right"><a href="#" id="newc" class="text-info" data-toggle="modal" data-target="#modalinsert" data-c="{{.Collection}}">New collection</a></li>
        {{end}}
        <!--
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Operations <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" url="insert" class="op">Insert</a></li>
            <li><a href="#" url="index" class="op">Index</a></li>
            <li><a href="#" url="update" class="op">Update</a></li>
            <li><a href="#" url="remove" class="op">Remove</a></li>
            <li><a href="#" url="drop" class="op">Drop</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Tables <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            {{range $index, $elem := .Tables}}
            <li><a href="#" class="tb">{{index $elem "tb"}}</a></li>
            {{end}}
          </ul>
        </li>
        <li><a href="#">new collection</a></li>
        -->
      </ul>
      <!--
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      -->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
