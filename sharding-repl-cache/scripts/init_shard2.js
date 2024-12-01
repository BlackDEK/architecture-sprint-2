rs.initiate({
  _id: "shard2",
  members: [
    { _id: 0, host: "shard2:27019" },
    { _id: 1, host: "shard2Replica1:27119" },
    { _id: 2, host: "shard2Replica2:27219" },
    { _id: 3, host: "shard2Replica3:27319" },
  ],
});
exit();
