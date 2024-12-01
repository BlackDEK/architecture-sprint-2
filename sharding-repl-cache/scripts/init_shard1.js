rs.initiate({
  _id: "shard1",
  members: [
    { _id: 0, host: "shard1:27018" },
    { _id: 1, host: "shard1Replica1:27118" },
    { _id: 2, host: "shard1Replica2:27218" },
    { _id: 3, host: "shard1Replica3:27318" },
  ],
});
exit();
