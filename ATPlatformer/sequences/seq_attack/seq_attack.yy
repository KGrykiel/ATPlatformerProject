{
  "resourceType": "GMSequence",
  "resourceVersion": "1.4",
  "name": "seq_attack",
  "spriteId": null,
  "timeUnits": 1,
  "playback": 0,
  "playbackSpeed": 120.0,
  "playbackSpeedType": 0,
  "autoRecord": true,
  "volume": 1.0,
  "length": 20.0,
  "events": {
    "Keyframes": [
      {"id":"d200a9d4-9013-4bb6-a924-8d92b63a8d51","Key":19.9999,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"Events":[
              "attack_end",
            ],"resourceVersion":"1.0","resourceType":"MessageEventKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<MessageEventKeyframe>",},
    ],
    "resourceVersion": "1.0",
    "resourceType": "KeyframeStore<MessageEventKeyframe>",
  },
  "moments": {
    "Keyframes": [
      {"id":"fd473e3b-7947-44b7-9a49-174e2be92877","Key":19.9999,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"Events":[
              "destroy_sequence",
            ],"resourceVersion":"1.0","resourceType":"MomentsEventKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<MomentsEventKeyframe>",},
    ],
    "resourceVersion": "1.0",
    "resourceType": "KeyframeStore<MomentsEventKeyframe>",
  },
  "tracks": [
    {"resourceType":"GMInstanceTrack","resourceVersion":"1.0","name":"obj_player_attack","keyframes":{"Keyframes":[
          {"id":"fbd1d7ad-10cf-47bd-a917-f1eeb272d597","Key":0.0,"Length":20.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"Id":{"name":"obj_player_attack","path":"objects/obj_player_attack/obj_player_attack.yy",},"resourceVersion":"1.0","resourceType":"AssetInstanceKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<AssetInstanceKeyframe>",},
        ],"resourceVersion":"1.0","resourceType":"KeyframeStore<AssetInstanceKeyframe>",},"trackColour":4289218802,"inheritsTrackColour":true,"builtinName":0,"traits":0,"interpolation":1,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","keyframes":{"Keyframes":[
              {"id":"58496031-ac4c-4585-9596-ece7be4ccc89","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":true,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":0.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},"1":{"EmbeddedAnimCurve":null,"RealValue":0.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4289218802,"inheritsTrackColour":true,"builtinName":16,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":true,"modifiers":[],},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","keyframes":{"Keyframes":[
              {"id":"e10d076b-c956-4c23-87de-0e4b5b10897a","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":-6.641464,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},"1":{"EmbeddedAnimCurve":null,"RealValue":-21.271297,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
              {"id":"f7ce1e45-b268-4d9b-902d-174fa51261d6","Key":19.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":29.358536,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},"1":{"EmbeddedAnimCurve":null,"RealValue":-22.271297,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4289218802,"inheritsTrackColour":true,"builtinName":14,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":false,"modifiers":[],},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","keyframes":{"Keyframes":[
              {"id":"fb6f0f97-14d5-4ea5-bf51-390b3179e9bc","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":true,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":0.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4289218802,"inheritsTrackColour":true,"builtinName":8,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":true,"modifiers":[],},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","keyframes":{"Keyframes":[
              {"id":"3018e5d7-964b-456c-8c7a-fbd9a1f53b03","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":0.171875,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},"1":{"EmbeddedAnimCurve":null,"RealValue":0.421875,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4289218802,"inheritsTrackColour":true,"builtinName":15,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":false,"modifiers":[],},
      ],"events":[],"isCreationTrack":false,"modifiers":[],},
    {"resourceType":"GMGraphicTrack","resourceVersion":"1.0","name":"spr_attack_smear","keyframes":{"Keyframes":[
          {"id":"ba12ef34-f8ca-49c6-9ffe-ed93237d00e0","Key":0.0,"Length":20.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"Id":{"name":"spr_attack_smear","path":"sprites/spr_attack_smear/spr_attack_smear.yy",},"resourceVersion":"1.0","resourceType":"AssetSpriteKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<AssetSpriteKeyframe>",},
        ],"resourceVersion":"1.0","resourceType":"KeyframeStore<AssetSpriteKeyframe>",},"trackColour":4282970742,"inheritsTrackColour":true,"builtinName":0,"traits":0,"interpolation":1,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","keyframes":{"Keyframes":[
              {"id":"a7e368b6-b215-4479-a605-4513abca2b6b","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":true,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":0.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},"1":{"EmbeddedAnimCurve":null,"RealValue":0.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4282970742,"inheritsTrackColour":true,"builtinName":16,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":true,"modifiers":[],},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","keyframes":{"Keyframes":[
              {"id":"073f0d69-c1f2-4bdb-9523-ab95ba0d4e9d","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":false,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":-20.579453,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},"1":{"EmbeddedAnimCurve":null,"RealValue":-23.87595,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4282970742,"inheritsTrackColour":true,"builtinName":14,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":false,"modifiers":[],},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","keyframes":{"Keyframes":[
              {"id":"b32852ea-29cc-4a02-95d0-b46a561fc821","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":true,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":0.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4282970742,"inheritsTrackColour":true,"builtinName":8,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":true,"modifiers":[],},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","keyframes":{"Keyframes":[
              {"id":"7e131a25-c7f9-4591-902a-7087e7030cc3","Key":0.0,"Length":1.0,"Stretch":false,"Disabled":false,"IsCreationKey":true,"Channels":{"0":{"EmbeddedAnimCurve":null,"RealValue":1.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},"1":{"EmbeddedAnimCurve":null,"RealValue":1.0,"AnimCurveId":null,"resourceVersion":"1.0","resourceType":"RealKeyframe",},},"resourceVersion":"1.0","resourceType":"Keyframe<RealKeyframe>",},
            ],"resourceVersion":"1.0","resourceType":"KeyframeStore<RealKeyframe>",},"trackColour":4282970742,"inheritsTrackColour":true,"builtinName":15,"traits":0,"interpolation":1,"tracks":[],"events":[],"isCreationTrack":true,"modifiers":[],},
      ],"events":[],"isCreationTrack":false,"modifiers":[],},
  ],
  "visibleRange": null,
  "lockOrigin": false,
  "showBackdrop": true,
  "showBackdropImage": false,
  "backdropImagePath": "",
  "backdropImageOpacity": 0.5,
  "backdropWidth": 1366,
  "backdropHeight": 768,
  "backdropXOffset": 0.0,
  "backdropYOffset": 0.0,
  "xorigin": -15,
  "yorigin": 23,
  "eventToFunction": {},
  "eventStubScript": null,
  "parent": {
    "name": "Sequences",
    "path": "folders/Sequences.yy",
  },
}