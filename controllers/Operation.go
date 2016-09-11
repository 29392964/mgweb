package controllers

import (
	//"github.com/astaxie/beego"
        "mgweb/models"
        //"strconv"
        "gopkg.in/mgo.v2/bson"
        "encoding/json"
        "strings"
)

type InsertController struct {
        BaseController
	//beego.Controller
}
type IndexController struct {
        BaseController
	//beego.Controller
}
type UpdateController struct {
        BaseController
	//beego.Controller
}
type RemoveController struct {
        BaseController
	//beego.Controller
}
type DropController struct {
        BaseController
	//beego.Controller
}

func (this *InsertController) Get() {
        this.Data["c"] = this.GetSession("c")
        this.TplName = "operation/insert.tpl"
}
func (this *IndexController) Get() {
        this.Data["c"] = this.GetSession("c")
        this.TplName = "operation/index.tpl"
}
func (this *UpdateController) Get() {
        this.Data["c"] = this.GetSession("c")
        this.TplName = "operation/update.tpl"
}
func (this *RemoveController) Get() {
        this.Data["c"] = this.GetSession("c")
        this.TplName = "operation/remove.tpl"
}
func (this *DropController) Get() {
        this.Data["c"] = this.GetSession("c")
        this.TplName = "operation/drop.tpl"
}



func (this *InsertController) Post(){
        uri,db := this.GetSession("uri").(string),this.GetSession("db").(string)
        /*b := []byte(`{"title":"a","body":"b"}`)
        var r map[string]interface{}
        json.Unmarshal(b,&r)*/

        c := this.GetString("c")
        s1 := this.GetString("json")
        //s1 := `{"title":"a","body":"b"}`
        b := []byte(s1)
        var r map[string]interface{}
        json.Unmarshal(b,&r)

        models.Insert(uri,db,c,r)
        this.Redirect("/", 302)
}

func (this *IndexController) Post(){
        uri,db := this.GetSession("uri").(string),this.GetSession("db").(string)
        c := this.GetString("c")
        s1 := this.GetString("json")
        ss := strings.Split(s1,",");
        models.Index(uri,db,c,ss)
        this.Redirect("/", 302)
}

func (this *UpdateController) Post(){
        uri,db := this.GetSession("uri").(string),this.GetSession("db").(string)
        c := this.GetString("c")
        s1 := this.GetString("filter")
        b := []byte(s1)
        var filter map[string]interface{}
        json.Unmarshal(b,&filter)
        s2 := this.GetString("json")
        b2 := []byte(s2)
        var r map[string]interface{}
        json.Unmarshal(b2,&r)
        if filter["_id"] != nil{
            filter["_id"] =bson.ObjectIdHex( filter["_id"].(string) )
        }
        models.Update(uri,db,c,filter,r)
        this.Redirect("/", 302)
}

func (this *RemoveController) Post(){
        uri,db := this.GetSession("uri").(string),this.GetSession("db").(string)
        c := this.GetString("c")
        s1 := this.GetString("json")
        b := []byte(s1)
        var r map[string]interface{}
        json.Unmarshal(b,&r)
        if r["_id"] != nil{
            r["_id"] =bson.ObjectIdHex( r["_id"].(string) ) 
        }
        //print(s1,r["_id"].(bson.ObjectId).String())
        models.Remove(uri,db,c,r)
        this.Redirect("/", 302)
}

func (this *DropController) Post(){
        uri,db := this.GetSession("uri").(string),this.GetSession("db").(string)
        c := this.GetString("c")
        models.Drop(uri,db,c)
        this.Redirect("/", 302)
}
