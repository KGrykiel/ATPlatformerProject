{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_testingRoom",
  "isDnd": false,
  "volume": 1.0,
  "parentRoom": null,
  "views": [
    {"inherit":false,"visible":true,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
  ],
  "layers": [
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Collisions","tilesetId":{"name":"ts_collisons","path":"tilesets/ts_collisons/ts_collisons.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":22,"SerialiseHeight":12,"TileCompressedData":[
1,3,-20,-2147483648,-2,3,-13,-2147483648,1,0,-6,-2147483648,-2,3,-20,-2147483648,-2,3,-5,-2147483648,-5,3,
1,-2147483648,-3,3,-2,-2147483648,3,3,0,0,-3,3,1,0,-8,-2147483648,1,0,-5,-2147483648,8,3,
-2147483648,0,-2147483648,-2147483648,3,3,0,-3,3,-5,-2147483648,-2,3,2,-2147483648,0,-4,-2147483648,-3,0,-2,3,
-12,-2147483648,-3,3,-2,-2147483648,3,0,-2147483648,-2147483648,-3,3,-3,-2147483648,-3,3,-10,-2147483648,5,0,3,0,
3,3,-8,-2147483648,-4,3,1,-2147483648,-3,3,9,-2147483648,3,3,0,3,3,-2147483648,3,3,-17,-2147483648,
-2,3,-19,-2147483648,-7,3,-2,-2147483648,-3,3,1,-2147483648,-3,3,5,-2147483648,3,3,-2147483648,0,-3,3,
],},"visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Sequences","assets":[],"visible":true,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2977A713","properties":[],"isDnd":false,"objectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":190.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_CB2B210","properties":[],"isDnd":false,"objectId":{"name":"obj_breakable_platform","path":"objects/obj_breakable_platform/obj_breakable_platform.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":352.0,"y":704.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_25222C63","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"path","path":"objects/obj_moving_platform/obj_moving_platform.yy",},"objectId":{"name":"obj_moving_platform","path":"objects/obj_moving_platform/obj_moving_platform.yy",},"value":"pth_test",},
          ],"isDnd":false,"objectId":{"name":"obj_moving_platform","path":"objects/obj_moving_platform/obj_moving_platform.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":320.0,"y":576.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4A281622","properties":[],"isDnd":false,"objectId":{"name":"obj_jumpy_platform","path":"objects/obj_jumpy_platform/obj_jumpy_platform.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":1120.0,"y":384.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_253661D9","properties":[],"isDnd":false,"objectId":{"name":"obj_conveyor_platform","path":"objects/obj_conveyor_platform/obj_conveyor_platform.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":320.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_50CE7075","properties":[],"isDnd":false,"objectId":{"name":"obj_breakable","path":"objects/obj_breakable/obj_breakable.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":640.0,"y":704.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5C25A456","properties":[],"isDnd":false,"objectId":{"name":"obj_breakable","path":"objects/obj_breakable/obj_breakable.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":1120.0,"y":704.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3AD1E8E6","properties":[],"isDnd":false,"objectId":{"name":"obj_breakable","path":"objects/obj_breakable/obj_breakable.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":256.0,"y":224.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4197EB6F","properties":[],"isDnd":false,"objectId":{"name":"obj_manager","path":"objects/obj_manager/obj_manager.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":672.0,"y":672.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3BBFDC1A","properties":[],"isDnd":false,"objectId":{"name":"obj_danger_zone","path":"objects/obj_danger_zone/obj_danger_zone.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":320.0,"y":736.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_717DF180","properties":[],"isDnd":false,"objectId":{"name":"obj_danger_zone","path":"objects/obj_danger_zone/obj_danger_zone.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":384.0,"y":736.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_A219DFD","properties":[],"isDnd":false,"objectId":{"name":"obj_danger_zone","path":"objects/obj_danger_zone/obj_danger_zone.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":896.0,"y":736.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_F7C00A5","properties":[],"isDnd":false,"objectId":{"name":"obj_danger_zone","path":"objects/obj_danger_zone/obj_danger_zone.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":640.0,"y":736.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_25ADACA3","properties":[],"isDnd":false,"objectId":{"name":"obj_danger_zone","path":"objects/obj_danger_zone/obj_danger_zone.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":1088.0,"y":736.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5BECA36B","properties":[],"isDnd":false,"objectId":{"name":"obj_danger_zone","path":"objects/obj_danger_zone/obj_danger_zone.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":1152.0,"y":736.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4051B602","properties":[],"isDnd":false,"objectId":{"name":"obj_danger_zone","path":"objects/obj_danger_zone/obj_danger_zone.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":1344.0,"y":736.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3130B9D2","properties":[],"isDnd":false,"objectId":{"name":"obj_camera","path":"objects/obj_camera/obj_camera.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":704.0,"y":672.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5B7F72F3","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"entity_activate_script","path":"objects/obj_interactable/obj_interactable.yy",},"objectId":{"name":"obj_interactable","path":"objects/obj_interactable/obj_interactable.yy",},"value":"change_colour",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"entity_activate_args","path":"objects/obj_interactable/obj_interactable.yy",},"objectId":{"name":"obj_interactable","path":"objects/obj_interactable/obj_interactable.yy",},"value":"[inst_3C4197EF]",},
          ],"isDnd":false,"objectId":{"name":"obj_interactable","path":"objects/obj_interactable/obj_interactable.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":512.0,"y":160.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3C4197EF","properties":[],"isDnd":false,"objectId":{"name":"obj_activatable_block_TEST","path":"objects/obj_activatable_block_TEST/obj_activatable_block_TEST.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":608.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3B008C2D","properties":[],"isDnd":false,"objectId":{"name":"obj_enemy","path":"objects/obj_enemy/obj_enemy.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":512.0,"y":160.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_39304826","properties":[],"isDnd":false,"objectId":{"name":"obj_enemy","path":"objects/obj_enemy/obj_enemy.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":800.0,"y":160.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4C14B822","properties":[],"isDnd":false,"objectId":{"name":"obj_enemy","path":"objects/obj_enemy/obj_enemy.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":928.0,"y":160.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_169957E7","properties":[],"isDnd":false,"objectId":{"name":"obj_platform","path":"objects/obj_platform/obj_platform.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":320.0,"y":160.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_31784FDA","properties":[],"isDnd":false,"objectId":{"name":"obj_platform","path":"objects/obj_platform/obj_platform.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":704.0,"y":160.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6097C075","properties":[],"isDnd":false,"objectId":{"name":"obj_inventory","path":"objects/obj_inventory/obj_inventory.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":96.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_45B49885","properties":[],"isDnd":false,"objectId":{"name":"obj_dummy_item_world","path":"objects/obj_dummy_item_world/obj_dummy_item_world.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":384.0,"y":416.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_50AA12E","properties":[],"isDnd":false,"objectId":{"name":"obj_dummy_item_world","path":"objects/obj_dummy_item_world/obj_dummy_item_world.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":704.0,"y":480.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_64CE1B3D","properties":[],"isDnd":false,"objectId":{"name":"obj_dummy_item_world","path":"objects/obj_dummy_item_world/obj_dummy_item_world.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":928.0,"y":352.0,},
      ],"visible":true,"depth":200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Backwalls","tilesetId":null,"x":0,"y":0,"tiles":{"SerialiseWidth":0,"SerialiseHeight":0,"TileSerialiseData":[
],},"visible":true,"depth":300,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","spriteId":null,"colour":4278190080,"x":0,"y":0,"htiled":false,"vtiled":false,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":15.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":400,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": false,
  "creationCodeFile": "",
  "inheritCode": false,
  "instanceCreationOrder": [
    {"name":"inst_2977A713","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_CB2B210","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_25222C63","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_4A281622","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_253661D9","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_50CE7075","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_5C25A456","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_3AD1E8E6","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_4197EB6F","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_3BBFDC1A","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_717DF180","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_A219DFD","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_F7C00A5","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_25ADACA3","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_5BECA36B","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_4051B602","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_3130B9D2","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_3B008C2D","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_39304826","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_4C14B822","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_169957E7","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_31784FDA","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_5B7F72F3","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_3C4197EF","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_6097C075","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_45B49885","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_50AA12E","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
    {"name":"inst_64CE1B3D","path":"rooms/rm_testingRoom/rm_testingRoom.yy",},
  ],
  "inheritCreationOrder": false,
  "sequenceId": null,
  "roomSettings": {
    "inheritRoomSettings": false,
    "Width": 1366,
    "Height": 768,
    "persistent": false,
  },
  "viewSettings": {
    "inheritViewSettings": false,
    "enableViews": true,
    "clearViewBackground": false,
    "clearDisplayBuffer": true,
  },
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
}