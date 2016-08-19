package models

import (
        //"fmt"
	//"log"
        "gopkg.in/mgo.v2"
        //"gopkg.in/mgo.v2/bson"
)

func Check(uri string) bool {
        _, err := mgo.Dial(uri)
        return err == nil
}

func Collections(uri, db string) []string {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collections,err := session.DB(db).CollectionNames()
        return collections
}

func Datas(uri, db string, c string, page int, pagesize int)( []map[string]interface{}, map[string]interface{}, int, int) {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(db).C(c)
        //var result map[string]interface{}
        var items []map[string]interface{}
        //iter := collection.Find(nil).Skip((page-1)*pagesize).Limit(pagesize).Iter()
        collection.Find(nil).Skip((page-1)*pagesize).Limit(pagesize).All(&items)
        //fmt.Printf("%v",items)
        dataCount, _ := collection.Find(nil).Count()
        /*for iter.Next(&result) {
                fmt.Printf("Result: %v\n", result)
                items =append(items, result.Clone())
        }*/
        return items,items[0],dataCount,dataCount / pagesize
}
