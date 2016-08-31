{{template "layout/bread.tpl" .}}
<table class="table table-striped table-hover ">
  <thead>
    <tr>
      {{range $k, $v := .Datas1}}
      <th>{{$k}}</th>
      {{end}}
      <th style="width:140px">Options</th>
    </tr>
  </thead>
  <tbody>
    {{range $index, $elem := .Datas}}
    <tr>
      {{range $k, $v := $elem}}
      <td>{{$v}}</td>
      {{end}}
      <td>
        <a href="#" class="text-info" data-toggle="modal" data-target="#modalupdate" data-id="{{$elem._id}}" data-c="{{$.Collection}}">Update</a> |
        <a href="#" class="text-danger" data-toggle="modal" data-target="#modalremove" data-id="{{$elem._id}}" data-c="{{$.Collection}}">Remove</a>
      </td>
    </tr>
    {{end}}
  </tbody>
</table> 
<script>pCount={{.PageCount}}</script>
