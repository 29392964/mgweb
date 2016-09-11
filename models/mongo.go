package models

import (
        //"fmt"
	//"log"
        "gopkg.in/mgo.v2"
        "math"
        "gopkg.in/mgo.v2/bson"
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

func Datas(uri, db string, c string, f interface{}, page int, pagesize int)( []map[string]interface{}, map[string]interface{}, int, int) {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(db).C(c)
        var items []map[string]interface{}
        collection.Find(f).Skip((page-1)*pagesize).Limit(pagesize).All(&items)
        
        for i,_ := range items {
            items[i]["_id"] = items[i]["_id"].(bson.ObjectId).Hex()
        }

        dataCount, _ := collection.Find(f).Count()
        /*for iter.Next(&result) {
                fmt.Printf("Result: %v\n", result)
                items =append(items, result.Clone())
        }*/
        if dataCount >0 {
                return items,items[0],dataCount,int(math.Ceil(float64(dataCount) / float64(pagesize)))
        }else {
                return items,nil,dataCount,dataCount / pagesize
        }
}

func Insert(uri, db, c string,data interface{}) bool {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(db).C(c)
        _err := collection.Insert(data)
        return _err ==nil
}

func Index(uri, db, c string,keys []string) bool {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(db).C(c)
        _err := collection.EnsureIndex(mgo.Index{Key: keys})
        return _err ==nil
}

func Update(uri, db, c string,filter,data interface{}) bool {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(db).C(c)
        _err := collection.Update(filter,data)
        return _err ==nil
}

func Remove(uri, db, c string,data interface{}) bool {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(db).C(c)
        _err := collection.Remove(data)
        return _err ==nil
}

func Drop(uri, db, c string) bool {
        session, err := mgo.Dial(uri)
        if err != nil {
                panic(err)
        }
        defer session.Close()
        session.SetMode(mgo.Monotonic, true)
        collection := session.DB(db).C(c)
        _err := collection.DropCollection()
        return _err ==nil
}
