package controllers

import (
	"github.com/astaxie/beego"
        "mgweb/models"
        "strings"
        //"fmt"
)

type LoginController struct {
	beego.Controller
}

func (this *LoginController) Get() {
	this.TplName = "login.tpl"
}

func (this *LoginController) Post() {
        uri := this.GetString("uri")
        if uri != "" {
            cnfuri := beego.AppConfig.String(uri)
            if cnfuri != "" {
                uri = cnfuri
            }
            if models.Check(uri) {
                index := strings.LastIndex(uri,"/")
                if index > 0 {
                    db := uri[index + 1 :]
                    this.SetSession("uri", uri)
                    this.SetSession("db", db)
                }
            }
        }
        this.Redirect("/", 302)
}

type LogoutController struct {
        beego.Controller
}

func (this *LogoutController) Get() {
        this.DelSession("uri")
        this.DelSession("db")
        this.DestroySession()
        this.Redirect("/login", 302)
}
