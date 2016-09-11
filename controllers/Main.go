package controllers

import (
	"github.com/astaxie/beego"
        "mgweb/models"
        "strconv"
        "encoding/json"
        "gopkg.in/mgo.v2/bson"
)

type MainController struct {
        BaseController
}

func (this *MainController) Get() {
        this.Data["db"], this.Data["Collections"] = this.db, models.Collections(this.uri,this.db)
        this.Data["Tables"],_,_,_ = models.Datas(this.uri,this.db,"tables",nil,1,100)
        this.SetSession("c","")       
        this.Data["Editable"] = this.editable
	this.TplName = "index.tpl"
}

func (this *MainController) Post(){
        collection := this.Input().Get("c")
        this.SetSession("c",collection)       
        s1 := this.GetString("filter")
        b := []byte(s1)
        var f map[string]interface{}
        json.Unmarshal(b,&f)
        if f["_id"] != nil{
            f["_id"] =bson.ObjectIdHex( f["_id"].(string) )
        }
        page, _ := strconv.Atoi(this.Input().Get("page")) 
        pagesize,_ := beego.AppConfig.Int("pagesize")
        this.Data["Datas"],this.Data["Datas1"],this.Data["Count"],this.Data["PageCount"] = models.Datas(this.uri,this.db,collection,f,page,pagesize)
        this.Data["Db"],this.Data["Collection"] = this.db, collection
        this.Data["Editable"] = this.editable
        this.TplName = "layout/table.tpl"
}
