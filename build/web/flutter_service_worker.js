'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "abfd9fb813aacfa2b9bd12dcd6591de1",
"assets/AssetManifest.bin.json": "917f95a88c6e1a834414c0d232004ba4",
"assets/AssetManifest.json": "b8345ac18ed954191ae187a80b74d327",
"assets/assets/200x200.png": "4237bf3598159d7b1aaebb4c4d802c54",
"assets/assets/adaptive-icon.png": "e089d308632212a954c2a1ef22ca2502",
"assets/assets/Icons/Add%2520Filled.svg": "d51c66a4c05d0cc6edc2680bc1393750",
"assets/assets/Icons/Add%2520Outline.svg": "7846f83103668cb1d21f673043fbe0cc",
"assets/assets/Icons/addicon.svg": "4efbd9ecdec8ee5f3c48f0ac7220ceae",
"assets/assets/Icons/addrectanglebutton.svg": "eed161533a5b828301d24e7d0292b6b2",
"assets/assets/Icons/add_person.svg": "7375f8374bf0c30dec4c3daa1c1af07b",
"assets/assets/Icons/backIcon.svg": "5cff56e69b0149d682b4e183e94c9f87",
"assets/assets/Icons/bike.png": "50857fcc550825b06a4f9c49abc1c6f0",
"assets/assets/Icons/bikeimage.png": "e2b9611475696eee78bacd9aff3a73be",
"assets/assets/Icons/bike_emergency.svg": "9c2f32e59b2cb4051183aec8b90ad95c",
"assets/assets/Icons/call.png": "f6953b15f4a587f3f9aa824692f3dd7f",
"assets/assets/Icons/call.svg": "891ceab5f350ad4edf5f4fa5891b95fb",
"assets/assets/Icons/camera.svg": "863ac43fd234916d7af4ff960b8c26c5",
"assets/assets/Icons/cross.svg": "5709c31742ba8a89689b57e88f456b7d",
"assets/assets/Icons/delete.svg": "7bdb8dd18aab2a26e9c22f044a97239a",
"assets/assets/Icons/download%25201.png": "73255fd4f1e4d5ec28184c8366b600f8",
"assets/assets/Icons/edit.svg": "c2aaa265db20f5cbcb08c9c07bef6d77",
"assets/assets/Icons/editableIcon.svg": "0e6a4a2e3b57dea16ebb5fc4404574c8",
"assets/assets/Icons/edit_icon.svg": "6056aa8170e61ebb5121fbeb924c9873",
"assets/assets/Icons/emergency.svg": "7578fa7b618a0c1225c074f167b739da",
"assets/assets/Icons/emergency_bike.svg": "079e3d335bebc8c1fd2d6c167b8bf2e2",
"assets/assets/Icons/excell.png": "220349c1ea89470a9867859e90bbcc67",
"assets/assets/Icons/excell.svg": "22fa7e44daaf865f6a82c7face4b1156",
"assets/assets/Icons/filledEmergency.svg": "fafd570552cdb4630fd873bda71a9d76",
"assets/assets/Icons/icon.png": "cf84edf0a8dce0266588a03cfcd72b4a",
"assets/assets/Icons/location.svg": "cdb2d6cecb6bab2cba4cfc25260501d1",
"assets/assets/Icons/upload.svg": "15390f99b23e58b4a2979b04b4157816",
"assets/assets/img.png": "9e9fa54f59ed9d3dc677d93544e21475",
"assets/assets/logo.png": "a006e441eaacb0ff27b6862da9f4d92d",
"assets/assets/logo.svg": "a03aec1d716e537b29c93f5ced567b41",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "6206084032afd628e2fc57e3e735e911",
"assets/NOTICES": "4b4626cbeb29bb528be1bb4233b69eef",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "ed45b5559928f04a811601a565b6ac5f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0ca2ec7fadc6d8a83fae43c910a08673",
"/": "0ca2ec7fadc6d8a83fae43c910a08673",
"main.dart.js": "90690a41e8fbd84152e36d73f317ab34",
"manifest.json": "0158b5ff7201a78a4f66c7ba5ad8ef3d",
"version.json": "2f09bdf2c2db6b2a82fa210c3c671ff9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
