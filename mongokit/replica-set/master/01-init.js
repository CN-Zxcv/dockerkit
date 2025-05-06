
// db = db.getSiblingDB("admin");
// db.auth("user", pass);
// db = db.getSiblingDB("config");
// db.createUser({});

// use admin;
rs.initiate({
    _id:"mongo-rs", 
    members:[
        {_id:0,host:"mongo-master:27017"},
        {_id:1,host:"mongo-slave:27017"},
        {_id:2,host:"mongo-arbiter:27017",arbiterOnly:true},
    ],
})    