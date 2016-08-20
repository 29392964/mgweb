package controllers

import (
	"github.com/astaxie/beego"
        "mgweb/models"
        "strconv"
)

type MainController struct {
	beego.Controller
        uri string
        db string
}

func (this *MainController) Prepare() {
    if this.GetSession("uri") == nil || this.GetSession("db") == nil {
        this.Redirect("/login", 302)
    }
    this.uri,this.db = this.GetSession("uri").(string),this.GetSession("db").(string)
}


func (this *MainController) Get() {
        this.Data["db"], this.Data["Collections"] = this.db, models.Collections(this.uri,this.db)
	this.TplName = "index.tpl"
}

func (this *MainController) Post(){
        collection := this.Input().Get("c")
        page, _ := strconv.Atoi(this.Input().Get("page")) 
        pagesize,_ := beego.AppConfig.Int("pagesize")
        this.Data["Datas"],this.Data["Datas1"],this.Data["Count"],this.Data["PageCount"] = models.Datas(this.uri,this.db,collection,page,pagesize)
        this.Data["Db"],this.Data["Collection"] = this.db, collection
        this.TplName = "layout/table.tpl"
}
