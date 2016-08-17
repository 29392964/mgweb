package controllers

import (
	"github.com/astaxie/beego"
        "mgweb/models"
        "strconv"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
        if this.GetSession("uri") == nil || this.GetSession("db") == nil {
            this.Redirect("/login", 302) 
        }
        uri,db := this.GetSession("uri").(string),this.GetSession("db").(string)
        this.Data["db"], this.Data["Collections"] = db, models.Collections(uri,db)
	this.TplName = "index.tpl"
}

func (this *MainController) Post(){
        uri,db := this.GetSession("uri").(string),this.GetSession("db").(string)
        collection := this.Input().Get("c")
        page, _ := strconv.Atoi(this.Input().Get("page")) 
        pagesize,_ := beego.AppConfig.Int("pagesize")
        this.Data["Datas"],this.Data["Datas1"],this.Data["Count"],this.Data["PageCount"] = models.Datas(uri,db,collection,page,pagesize)
        this.Data["Db"],this.Data["Collection"] = db, collection
        this.TplName = "layout/table.tpl"
}
