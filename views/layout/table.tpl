{{template "layout/bread.tpl" .}}
<table class="table table-striped table-hover ">
  <thead>
    <tr>
      {{range $k, $v := .Datas1}}
      <th>{{$k}}</th>
      {{end}}
    </tr>
  </thead>
  <tbody>
    {{range $index, $elem := .Datas}}
    <tr>
      {{range $k, $v := $elem}}
      <td>{{$v}}</td>
      {{end}}
    </tr>
    {{end}}
  </tbody>
</table> 
<script>pCount={{.PageCount}}</script>
