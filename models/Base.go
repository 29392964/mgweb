package models

import (
        //"fmt"
        //"log"
        "gopkg.in/mgo.v2"
        "math"
        //"gopkg.in/mgo.v2/bson"
)

type Base struct {
    uri string
    db string
    c string        
}  

func(this *Base)Set(uri,db,c string) {
    this.uri = uri
    this.db = db
    this.c = c
}

func(this *Base)Collections() []string {
        session, err := mgo.Dial(this.uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collections,err := session.DB(this.db).CollectionNames()
        return collections
}

func(this *Base) Datas( filter interface{},page, pagesize int)( []map[string]interface{}, map[string]interface{}, int, int) {
        session, err := mgo.Dial(this.uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(this.db).C(this.c)
        var items []map[string]interface{}
        collection.Find(filter).Skip((page-1)*pagesize).Limit(pagesize).All(&items)
        dataCount, _ := collection.Find(nil).Count()
        if dataCount >0 {
                return items,items[0],dataCount,int(math.Ceil(float64(dataCount) / float64(pagesize)))
        }else {
                return items,nil,dataCount,dataCount / pagesize
        }
}

func(this *Base) Insert(data interface{}) bool {
        session, err := mgo.Dial(this.uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(this.db).C(this.c)
        _err := collection.Insert(data)
        return _err ==nil
}

func(this *Base) Index(keys []string) bool {
        session, err := mgo.Dial(this.uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(this.db).C(this.c)
        _err := collection.EnsureIndex(mgo.Index{Key: keys})
        return _err ==nil
}

func(this *Base) Update(filter,data interface{}) bool {
        session, err := mgo.Dial(this.uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(this.db).C(this.c)
        _err := collection.Update(filter,data)
        return _err ==nil
}

func(this *Base) Remove(data interface{}) bool {
        session, err := mgo.Dial(this.uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(this.db).C(this.c)
        _err := collection.Remove(data)
        return _err ==nil
}

func(this *Base) Drop() bool {
        session, err := mgo.Dial(this.uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(this.db).C(this.c)
        _err := collection.DropCollection()
        return _err ==nil
}

