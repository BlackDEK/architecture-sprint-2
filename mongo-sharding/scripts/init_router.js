sh.addShard( "shard1/shard1:27018");
sh.addShard( "shard2/shard2:27019");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb

var docs = [];
for(var i = 0; i < 1000; i++) {
    docs.push({age:i, name:"ly"+i})
    
} 
db.helloDoc.insertMany(docs);

db.helloDoc.countDocuments() 
exit();
