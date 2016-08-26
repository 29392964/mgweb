package controllers

import (
    "github.com/astaxie/beego"
    //"strings"
)

type BaseController struct {
    beego.Controller
    uri string
    db string
}

func (this *BaseController) Prepare() {
    if this.GetSession("uri") == nil || this.GetSession("db") == nil {
        this.Redirect("/login", 302)
    }
    this.uri,this.db = this.GetSession("uri").(string),this.GetSession("db").(string)
}
