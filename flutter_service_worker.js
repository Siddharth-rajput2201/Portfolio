'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "bd314a10694148580d99c442be55866b",
"assets/NOTICES": "1c74a4dd0340555e41155dfc29585ad6",
"assets/assets/images/coivd19tracker.png": "4abfa0a9ab0741ca5501053fd355e584",
"assets/assets/images/instagram.png": "03f40b67b63d9c1c1a5a792109bbc699",
"assets/assets/images/downloadicon.png": "8980dcbf6406a2dd29278bdce4f5d33a",
"assets/assets/images/homepricepredictorapplogo.png": "3b883cbc203770f60c610dd097c5bb6a",
"assets/assets/images/bmicalculator.png": "4bd600a5be9d5e940ffdf0413263a5b9",
"assets/assets/images/resume.png": "203167b50028d11519c4c1f2d5ebee59",
"assets/assets/images/xylophonelogo.png": "0efa6ad4eeb4fc5f7f15a20cb1f9305e",
"assets/assets/images/instagramicon.png": "ff790431db4ec22eed255faa064928fc",
"assets/assets/images/linkdin.png": "ad1ec6623210f7c63babe6b1597ea9ec",
"assets/assets/images/profile_photo2.jpg": "4d4bf5b1325d597698042a2ffe38c993",
"assets/assets/images/github.png": "c40ccb4c6291e01e99a4f36e9d6b0883",
"assets/assets/images/profile_photo.jpeg": "e6b30dba62df312f77d26c4479ecfd25",
"assets/assets/images/padhlologo.png": "bd51df501771fafb3d82b65a7975b4c5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/AssetManifest.json": "965a1aea38e2f40fb3b2b8fb98bc5e33",
"index.html": "7fa6cb95795c3afd33b6e5b2f9e35723",
"/": "7fa6cb95795c3afd33b6e5b2f9e35723",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/apple-icon-144x144.png": "ea48fd6b7a2eb6fd1a75ae195853b00a",
"icons/apple-icon-57x57.png": "08edede2fc48963664645ca8bffd2e47",
"icons/apple-icon.png": "cc15207a22f34c5f674a732d9239887d",
"icons/ms-icon-144x144.png": "a576bbbf319e069f8b5a543b87adedbb",
"icons/android-icon-72x72.png": "6ccede621537b3ee010feb61f87f6964",
"icons/android-icon-36x36.png": "6c85a4a9c86f5ffa0387335f2cb2bf11",
"icons/favicon-32x32.png": "2d1324abb4d239d3a93391f2b082aca6",
"icons/apple-icon-152x152.png": "f3a6c95af48c54f5cad20f900135f99b",
"icons/apple-icon-180x180.png": "f60744f825267909ff3eded2d102c648",
"icons/apple-icon-76x76.png": "b75342addb60898b313799e82777ffbb",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/android-icon-192x192.png": "9a78686fe79438cb33a2a937ab3f8613",
"icons/ms-icon-150x150.png": "6b6e7cc2c70fa6d485050ac35e8bb3c0",
"icons/favicon.ico": "700893ae36e49c637c4351322e0d961a",
"icons/ms-icon-70x70.png": "db303c347fa01501659c56208897536b",
"icons/ms-icon-310x310.png": "8c17a9cfd29eb32227bffd27b6449ebf",
"icons/favicon-16x16.png": "e7711f7bc3c1c417476b9d6393b9e044",
"icons/apple-icon-114x114.png": "dc4cf207674ddde0481a220ad530bba2",
"icons/apple-icon-60x60.png": "fc963adb412d048e4ea92f644ad2b352",
"icons/favicon-96x96.png": "8bd79928b5e68a3316105bca810e3d83",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "ea48fd6b7a2eb6fd1a75ae195853b00a",
"icons/apple-icon-120x120.png": "43c98e6604b18fef346c70f77089704f",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/apple-icon-72x72.png": "6ccede621537b3ee010feb61f87f6964",
"icons/android-icon-48x48.png": "015930d7c24e51bcb53e0167acad8c25",
"icons/android-icon-96x96.png": "dcaf660b8b74784483f75b1998aebd39",
"icons/apple-icon-precomposed.png": "cc15207a22f34c5f674a732d9239887d",
"manifest.json": "ba8338a04ca469d9df486d163a5bec96",
"version.json": "426313f2f3133c2f20415344c4a22df3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
