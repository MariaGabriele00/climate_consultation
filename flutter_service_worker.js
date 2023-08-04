'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "35b6700db55852a7c1a9af77cf5798d7",
"assets/AssetManifest.bin": "ccad19c50a3cfac82a73613aac14149c",
"assets/AssetManifest.json": "a9938bd864c3f833eff7478d2faf2e98",
"assets/assets/several-icons/wi-alien.svg": "531b634c40d3d6ee87c1c37e09865ba9",
"assets/assets/several-icons/wi-barometer.svg": "997436c237683fc2617358b62e3b2c56",
"assets/assets/several-icons/wi-celsius.svg": "2d5fb94096f6a0dd48d00cd8e1566d33",
"assets/assets/several-icons/wi-cloud-down.svg": "e10599402af02fe88dd4eaae79fdc72b",
"assets/assets/several-icons/wi-cloud-refresh.svg": "19b10c5f271b055225c7ee56382d71d4",
"assets/assets/several-icons/wi-cloud-up.svg": "c6d57c766b493ba838b5be906bdf4b18",
"assets/assets/several-icons/wi-cloud.svg": "82408b66052f4d1c4ebe7376ad490c8b",
"assets/assets/several-icons/wi-cloudy-gusts.svg": "8f977e0c609cf550b7cce9bb0b90bd42",
"assets/assets/several-icons/wi-cloudy-windy.svg": "988749e88d71465ce6f62f4ed707bf2c",
"assets/assets/several-icons/wi-cloudy.svg": "2d0410c52e9fe2b3e0fb905f129ad19a",
"assets/assets/several-icons/wi-day-cloudy-gusts.svg": "28859f6519239eead587ad8051b632f5",
"assets/assets/several-icons/wi-day-cloudy-high.svg": "60f84c71fabfbc84348d04fdc83a47a0",
"assets/assets/several-icons/wi-day-cloudy-windy.svg": "8dfc3bc5a7395bc0877043b102a852f3",
"assets/assets/several-icons/wi-day-cloudy.svg": "3237f7da426fbedf7faa6782f8c4c455",
"assets/assets/several-icons/wi-day-fog.svg": "493be2a811d011aaac110a81defcd374",
"assets/assets/several-icons/wi-day-hail.svg": "307f87845d9095288733a2b6b2e6b37a",
"assets/assets/several-icons/wi-day-haze.svg": "cd4506ada6c25813a38c2668d724271a",
"assets/assets/several-icons/wi-day-light-wind.svg": "746b40a81dda99faccfec37677be3114",
"assets/assets/several-icons/wi-day-lightning.svg": "42698e359a19c767f0a6f41e1defb902",
"assets/assets/several-icons/wi-day-rain-mix.svg": "ea0763d6c92254adb443e6c14740ca38",
"assets/assets/several-icons/wi-day-rain-wind.svg": "52c484ed757d77ed5693f997c4f1cb0b",
"assets/assets/several-icons/wi-day-rain.svg": "ac93e407f620ec5eee663939681d518f",
"assets/assets/several-icons/wi-day-showers.svg": "86f986fca5306e37fe323f0b8b7cc389",
"assets/assets/several-icons/wi-day-sleet-storm.svg": "9b85f535a6945f6a48b379ecdac23ea3",
"assets/assets/several-icons/wi-day-sleet.svg": "f45eece5fd4f0a91695fe6928be5e2d5",
"assets/assets/several-icons/wi-day-snow-thunderstorm.svg": "203aa99134d9de86a1bc926829351978",
"assets/assets/several-icons/wi-day-snow-wind.svg": "04cc1b6db8e66dd8830db8fe00d00491",
"assets/assets/several-icons/wi-day-snow.svg": "0437c5fe50f97b1f696b135b8736f58a",
"assets/assets/several-icons/wi-day-sprinkle.svg": "83ad8e0b67ba1d2333f49fd84cade17f",
"assets/assets/several-icons/wi-day-storm-showers.svg": "686b9678b224f1fe8a857409cea065b8",
"assets/assets/several-icons/wi-day-sunny-overcast.svg": "92905ca491a3ace1e36a512242b4dc14",
"assets/assets/several-icons/wi-day-sunny.svg": "4b9869a6859846e524d1985de86894f7",
"assets/assets/several-icons/wi-day-thunderstorm.svg": "a1ec88df52249ece1a6bc37e8eebe1bd",
"assets/assets/several-icons/wi-day-windy.svg": "5653ab64d1d6844752d6d0ebdbbea019",
"assets/assets/several-icons/wi-degrees.svg": "3c3cc3b2d4cf8336605578002e6f797e",
"assets/assets/several-icons/wi-direction-down-left.svg": "4eb23b5a1795eae3c07586b7fc935108",
"assets/assets/several-icons/wi-direction-down-right.svg": "758caacb5e2fc99f9fc4c673e404309d",
"assets/assets/several-icons/wi-direction-down.svg": "9872bcc4037fd576c11e30836dd49c78",
"assets/assets/several-icons/wi-direction-left.svg": "541ab229782db51195fa72c7e570b61c",
"assets/assets/several-icons/wi-direction-right.svg": "3bdab7aec1dd55e3d2d61a2d97c269b4",
"assets/assets/several-icons/wi-direction-up-left.svg": "255f6df34b1ab36a5745d7ac744c9f57",
"assets/assets/several-icons/wi-direction-up-right.svg": "cbd11a695ae0e2a6e8567018003cc36b",
"assets/assets/several-icons/wi-direction-up.svg": "784874dface6e56e3bf637d05d675fe3",
"assets/assets/several-icons/wi-dust.svg": "d66e1eebede09874d16cd86e7c35d57d",
"assets/assets/several-icons/wi-earthquake.svg": "ab3c230b847f5f9f068aae51b691c273",
"assets/assets/several-icons/wi-fahrenheit.svg": "66b095cf95b64ef9d853b2815cd92354",
"assets/assets/several-icons/wi-fire.svg": "6268a47ef2e95d73bc1e45dadfdf5a1a",
"assets/assets/several-icons/wi-flood.svg": "a263997d94b152f298a6575660f897da",
"assets/assets/several-icons/wi-fog.svg": "c356784f45aaa40ef57ed9031101d912",
"assets/assets/several-icons/wi-gale-warning.svg": "7bc33419ab629480052f195049f897c5",
"assets/assets/several-icons/wi-hail.svg": "a4598f7699558fa2a8201690bd673fc4",
"assets/assets/several-icons/wi-horizon-alt.svg": "c02360f87e7e372b20564d0387dc3cc3",
"assets/assets/several-icons/wi-horizon.svg": "7da71f4c576c7914581248d67205b269",
"assets/assets/several-icons/wi-hot.svg": "1057600879741c7acd7e2982a96c990c",
"assets/assets/several-icons/wi-humidity.svg": "ace478e89dad3f20c96b3532b123cfdc",
"assets/assets/several-icons/wi-hurricane-warning.svg": "7a67f74716d278d680c3752d344886e0",
"assets/assets/several-icons/wi-hurricane.svg": "dcb4ac8744c261c45422dd67e46a65bf",
"assets/assets/several-icons/wi-lightning.svg": "be8364b31b4ff5c5b9f4c624d982dd98",
"assets/assets/several-icons/wi-lunar-eclipse.svg": "82da2b9d23e84d73d1fcacd6abe6fcfc",
"assets/assets/several-icons/wi-meteor.svg": "2e40242004e7b077aeba0a24a49e79b7",
"assets/assets/several-icons/wi-moon-alt-first-quarter.svg": "6c7323bcb51469aca39b873df64d2995",
"assets/assets/several-icons/wi-moon-alt-full.svg": "00bd422b9134608a30a14c2f9591c03c",
"assets/assets/several-icons/wi-moon-alt-new.svg": "e2bd0eb053dd9ba3e13691839cdfdfe9",
"assets/assets/several-icons/wi-moon-alt-third-quarter.svg": "052c33f8eac8ec6b3dff1bcecc31ab43",
"assets/assets/several-icons/wi-moon-alt-waning-crescent-1.svg": "3a1ae04c628723b956553045442644ae",
"assets/assets/several-icons/wi-moon-alt-waning-crescent-2.svg": "9135182cea9751f2a02f8793b8f654eb",
"assets/assets/several-icons/wi-moon-alt-waning-crescent-3.svg": "c0af4998a8957bcac0d75140bfa98023",
"assets/assets/several-icons/wi-moon-alt-waning-crescent-4.svg": "f8a92b76e53f677d20ad7bbe5b3da35b",
"assets/assets/several-icons/wi-moon-alt-waning-crescent-5.svg": "dbba3edc243c3297a1a95c18c95d64e5",
"assets/assets/several-icons/wi-moon-alt-waning-crescent-6.svg": "d11167a379262d098bcace6f37f19148",
"assets/assets/several-icons/wi-moon-alt-waning-gibbous-1.svg": "23603eab5ea8da28093566993c79417a",
"assets/assets/several-icons/wi-moon-alt-waning-gibbous-2.svg": "0c6b57640224b3b5d68ab5f7b0ea778f",
"assets/assets/several-icons/wi-moon-alt-waning-gibbous-3.svg": "4f46eea906f5233d33b9a4fcd5ee77fe",
"assets/assets/several-icons/wi-moon-alt-waning-gibbous-4.svg": "6c8c04bec9292150ae209e5a12dedafe",
"assets/assets/several-icons/wi-moon-alt-waning-gibbous-5.svg": "d6a1f57efb462428413a59b7ee8e8712",
"assets/assets/several-icons/wi-moon-alt-waning-gibbous-6.svg": "c4f7014f316c489b5389718158d84a75",
"assets/assets/several-icons/wi-moon-alt-waxing-crescent-1.svg": "3ce871de04c7f33a2954621b5e665738",
"assets/assets/several-icons/wi-moon-alt-waxing-crescent-2.svg": "1d52a3a0a9bbd29e059c3c54def57f4d",
"assets/assets/several-icons/wi-moon-alt-waxing-crescent-3.svg": "aca423e56d39033ef58ca270ceb0a8c2",
"assets/assets/several-icons/wi-moon-alt-waxing-crescent-4.svg": "215ec14cf5e02a6cc38352df152d21b2",
"assets/assets/several-icons/wi-moon-alt-waxing-crescent-5.svg": "2b2409473cf8934ace545e80aa1d22ab",
"assets/assets/several-icons/wi-moon-alt-waxing-crescent-6.svg": "0e83bad2ce4d8cb681cdee0b315854e7",
"assets/assets/several-icons/wi-moon-alt-waxing-gibbous-1.svg": "2822bad28151d2b838e41bf6f20634b3",
"assets/assets/several-icons/wi-moon-alt-waxing-gibbous-2.svg": "b27b9ecc0ff3b3f9c205fa33d688635a",
"assets/assets/several-icons/wi-moon-alt-waxing-gibbous-3.svg": "101f770df9266106054392db0e883e1f",
"assets/assets/several-icons/wi-moon-alt-waxing-gibbous-4.svg": "afea03377f4cfc9afdd02ef21b02bcb1",
"assets/assets/several-icons/wi-moon-alt-waxing-gibbous-5.svg": "1bbe75956b9a5677c035bf275a6c76e2",
"assets/assets/several-icons/wi-moon-alt-waxing-gibbous-6.svg": "0aea7499a63197043c78cccc512528f6",
"assets/assets/several-icons/wi-moon-first-quarter.svg": "67c1fdf38da6ad68a5de6698fdb54684",
"assets/assets/several-icons/wi-moon-full.svg": "e2bd0eb053dd9ba3e13691839cdfdfe9",
"assets/assets/several-icons/wi-moon-new.svg": "00bd422b9134608a30a14c2f9591c03c",
"assets/assets/several-icons/wi-moon-third-quarter.svg": "8c4adbb02aba4e94c02d762bb85a27ac",
"assets/assets/several-icons/wi-moon-waning-crescent-1.svg": "3641a7a0833058a48e4a16d13172ac91",
"assets/assets/several-icons/wi-moon-waning-crescent-2.svg": "585bcf211ec06d578fad0f91ee79bdd7",
"assets/assets/several-icons/wi-moon-waning-crescent-3.svg": "94f28050a506b22cb4bf0dd6e6aa60fc",
"assets/assets/several-icons/wi-moon-waning-crescent-4.svg": "55e9a0a8e6cc58a50e3bd98fc23b26bc",
"assets/assets/several-icons/wi-moon-waning-crescent-5.svg": "71cd7ab84e972c9f4a5f4bba0db34916",
"assets/assets/several-icons/wi-moon-waning-crescent-6.svg": "d5335d4adead7c3af5f65eefef276ddd",
"assets/assets/several-icons/wi-moon-waning-gibbous-1.svg": "2cffc20333428487dd54693119c85eb0",
"assets/assets/several-icons/wi-moon-waning-gibbous-2.svg": "36a2a067be11b34e80d06f4ac74fb114",
"assets/assets/several-icons/wi-moon-waning-gibbous-3.svg": "fdeed6f24f22b6268a08730aa4b3ce13",
"assets/assets/several-icons/wi-moon-waning-gibbous-4.svg": "ca57970a71eb1fff29c0a536646907eb",
"assets/assets/several-icons/wi-moon-waning-gibbous-5.svg": "373b8266ea8ed89d032d3a642bb97253",
"assets/assets/several-icons/wi-moon-waning-gibbous-6.svg": "2a6194de04711079ecba72ed8380ceeb",
"assets/assets/several-icons/wi-moon-waxing-6.svg": "b648bf895a6ef6b24d7dc5338bfc72c7",
"assets/assets/several-icons/wi-moon-waxing-crescent-1.svg": "6a17d1525a409fa0e4750676d4a136ea",
"assets/assets/several-icons/wi-moon-waxing-crescent-2.svg": "71cca0fee45490eaecbe66786d454ada",
"assets/assets/several-icons/wi-moon-waxing-crescent-3.svg": "fd643dfef080e1d435af8b4c1e65c03c",
"assets/assets/several-icons/wi-moon-waxing-crescent-4.svg": "86a428721dfa903cdcf9bb0ac07938b4",
"assets/assets/several-icons/wi-moon-waxing-crescent-5.svg": "b648bf895a6ef6b24d7dc5338bfc72c7",
"assets/assets/several-icons/wi-moon-waxing-gibbous-1.svg": "88d11cd876070176437d235b5de193f8",
"assets/assets/several-icons/wi-moon-waxing-gibbous-2.svg": "183da817d15e143789778d93317d835e",
"assets/assets/several-icons/wi-moon-waxing-gibbous-3.svg": "0544157bdafe1dd0313bec2b1078e281",
"assets/assets/several-icons/wi-moon-waxing-gibbous-4.svg": "a597394511f0bda7e0f148db8e20f6ad",
"assets/assets/several-icons/wi-moon-waxing-gibbous-5.svg": "1b91ef0f9add73846fcdc576379a5591",
"assets/assets/several-icons/wi-moon-waxing-gibbous-6.svg": "3b9f7d10d765d4990705bbfd81213641",
"assets/assets/several-icons/wi-moonrise.svg": "5e6841e2a95e0ef829c3106c7960b623",
"assets/assets/several-icons/wi-moonset.svg": "18f91498cc6f98e8ad98856485913343",
"assets/assets/several-icons/wi-na.svg": "fd90aeab153084786ebff365b91f3419",
"assets/assets/several-icons/wi-night-alt-cloudy-gusts.svg": "fc2e7bc82223c21365213a2b484db569",
"assets/assets/several-icons/wi-night-alt-cloudy-high.svg": "2fdaa36bd6fc3af59ed530f163255ed7",
"assets/assets/several-icons/wi-night-alt-cloudy-windy.svg": "07db20d635cfde98563cdb06f7b54edc",
"assets/assets/several-icons/wi-night-alt-cloudy.svg": "7c36f2b5180391599389cc38849eb89d",
"assets/assets/several-icons/wi-night-alt-hail.svg": "1c9558261632ac23cefb746918f3facf",
"assets/assets/several-icons/wi-night-alt-lightning.svg": "b9ee5038892977ce6930f8e489956150",
"assets/assets/several-icons/wi-night-alt-partly-cloudy.svg": "b75d90bdda7e56b0435b10a36d87392e",
"assets/assets/several-icons/wi-night-alt-rain-mix.svg": "79e70b3659ec800424ccdec617ef299f",
"assets/assets/several-icons/wi-night-alt-rain-wind.svg": "6dfa13419e87616d93bfce49f058f3eb",
"assets/assets/several-icons/wi-night-alt-rain.svg": "bc016c3b72a5843f21623b98e9c90f3d",
"assets/assets/several-icons/wi-night-alt-showers.svg": "8ea1ac4e4686afcd6d32776a8c6879e7",
"assets/assets/several-icons/wi-night-alt-sleet-storm.svg": "3bf07524cf1ca030776a4ff21f522840",
"assets/assets/several-icons/wi-night-alt-sleet.svg": "0bda2fbb706e331c898eb3baa59fc8fb",
"assets/assets/several-icons/wi-night-alt-snow-thunderstorm.svg": "a9e0233f71dfbf0f5b7978ee53a97b49",
"assets/assets/several-icons/wi-night-alt-snow-wind.svg": "77e6d8969dfd81a2c277cd12b04b159d",
"assets/assets/several-icons/wi-night-alt-snow.svg": "db72088b07bc32e7beee32cc8408f26f",
"assets/assets/several-icons/wi-night-alt-sprinkle.svg": "136e99617edae7b63187401a54471df2",
"assets/assets/several-icons/wi-night-alt-storm-showers.svg": "83f2607826e2c0f225a02066db19ace1",
"assets/assets/several-icons/wi-night-alt-thunderstorm.svg": "8a97fabc4397460de410f5127c339cdb",
"assets/assets/several-icons/wi-night-clear.svg": "f86c33c4ccc36dbeb826cbdb5f50594b",
"assets/assets/several-icons/wi-night-cloudy-gusts.svg": "907c20a58f724e68f924397449c6eede",
"assets/assets/several-icons/wi-night-cloudy-high.svg": "b2445272380709d675a521c75ab581db",
"assets/assets/several-icons/wi-night-cloudy-windy.svg": "527741fa50e7ab1d1bc887e4f9aeeadf",
"assets/assets/several-icons/wi-night-cloudy.svg": "abda2f646ad5c3ece93e4db304e86b10",
"assets/assets/several-icons/wi-night-fog.svg": "7f68f0ff6f6536dd9cb27be521b2881d",
"assets/assets/several-icons/wi-night-hail.svg": "cdc48240d1570cbc07e845fdaa56048b",
"assets/assets/several-icons/wi-night-lightning.svg": "130262db9db479b674c60b9a47816179",
"assets/assets/several-icons/wi-night-partly-cloudy.svg": "567c9bd7fe5de02ebc0129e851b2b105",
"assets/assets/several-icons/wi-night-rain-mix.svg": "1d0aa7dbca627d4a062c96a14b3efd54",
"assets/assets/several-icons/wi-night-rain-wind.svg": "3957d00e62000e9b42eb6c281df1422c",
"assets/assets/several-icons/wi-night-rain.svg": "b0c6ff5d9328fd9e6f7359283c91d2be",
"assets/assets/several-icons/wi-night-showers.svg": "e65996e37ba9c9fa105049d6d3b0c29c",
"assets/assets/several-icons/wi-night-sleet-storm.svg": "c65f0bf35c13e1d9c03fc1bc1b085ba8",
"assets/assets/several-icons/wi-night-sleet.svg": "57c7fe43edbb263a64d638f35a0f0ad9",
"assets/assets/several-icons/wi-night-snow-thunderstorm.svg": "df31aa073ab927f05c9b911511dfc283",
"assets/assets/several-icons/wi-night-snow-wind.svg": "87bc0271f7a30df74ee5990f1d39d708",
"assets/assets/several-icons/wi-night-snow.svg": "bdaa4c8d3f7c6349d3aa61837083debc",
"assets/assets/several-icons/wi-night-sprinkle.svg": "729719bc0754fbd1e093288e49934365",
"assets/assets/several-icons/wi-night-storm-showers.svg": "21225e304c25be2cd2a43474ac2e7b9d",
"assets/assets/several-icons/wi-night-thunderstorm.svg": "d44a5fdcf9c938ec91348518c015f41c",
"assets/assets/several-icons/wi-rain-mix.svg": "67c5e2561147500e2dcfaa34b6903b66",
"assets/assets/several-icons/wi-rain-wind.svg": "4635f2772c90baecda1e760bbd67f91e",
"assets/assets/several-icons/wi-rain.svg": "e13be320202dc94ef0d3696c1f508d24",
"assets/assets/several-icons/wi-raindrop.svg": "5ac590b7c142c7d4205c502edecf748c",
"assets/assets/several-icons/wi-raindrops.svg": "45d30c621cddd753486f07b636f7a8d0",
"assets/assets/several-icons/wi-refresh-alt.svg": "6b5be906701b5e8666c9104dbbd60251",
"assets/assets/several-icons/wi-refresh.svg": "ae069e32a4a683727ca4a51b27d72108",
"assets/assets/several-icons/wi-sandstorm.svg": "631f7b8dff9ff6ec9aa2a968aa664765",
"assets/assets/several-icons/wi-showers.svg": "751f534517c6cb83b1c7ec78fd32786d",
"assets/assets/several-icons/wi-sleet.svg": "8291f3539cf9ca67ea3680a1a4a720f5",
"assets/assets/several-icons/wi-small-craft-advisory.svg": "5106f61daad94d020fec3e706d85c220",
"assets/assets/several-icons/wi-smog.svg": "042cd80fef694e39263228e8c5e627f8",
"assets/assets/several-icons/wi-smoke.svg": "1325271128c1f81a2695f3619434888a",
"assets/assets/several-icons/wi-snow-wind.svg": "0434333c0751afceef49f28c6fccea91",
"assets/assets/several-icons/wi-snow.svg": "1a2bbf7db1720db83324bbf482344ec4",
"assets/assets/several-icons/wi-snowflake-cold.svg": "10a793ebc6338f2b279727fd2de81308",
"assets/assets/several-icons/wi-solar-eclipse.svg": "98ca3860e8a739d4e9c2a6cefaec6e04",
"assets/assets/several-icons/wi-sprinkle.svg": "36a19f5b73a3d68d6fc8b480a9714bea",
"assets/assets/several-icons/wi-stars.svg": "36217d383b037311dd2e627cb88506d8",
"assets/assets/several-icons/wi-storm-showers.svg": "64d9af100ecccd48a7c29f9d781b1ef6",
"assets/assets/several-icons/wi-storm-warning.svg": "a3fae3f4aebcc77204dc53ef4ed47216",
"assets/assets/several-icons/wi-strong-wind.svg": "b9d8d3cf851d2253ea0f306c860c5812",
"assets/assets/several-icons/wi-sunrise.svg": "11f9daa177005434b7579ac59fe246f4",
"assets/assets/several-icons/wi-sunset.svg": "d96e94d55441191c134f7bb19690785c",
"assets/assets/several-icons/wi-thermometer-exterior.svg": "9a23179e56c86ac0a6ab929d3baae9e0",
"assets/assets/several-icons/wi-thermometer-internal.svg": "1968dadd1e36e188133385f7662681d0",
"assets/assets/several-icons/wi-thermometer.svg": "24e49e257194e282863970afea2e1300",
"assets/assets/several-icons/wi-thunderstorm.svg": "22fff390b0fcd9c46390fe913b23895d",
"assets/assets/several-icons/wi-time-1.svg": "afcf33deb0883dc82c16ba83874d216c",
"assets/assets/several-icons/wi-time-10.svg": "a0eacea9d241f1724bc79a04adb80061",
"assets/assets/several-icons/wi-time-11.svg": "c2efba5e9b60fb70b2467a762e429a57",
"assets/assets/several-icons/wi-time-12.svg": "137807d53dba2d42fa6118873ba2855c",
"assets/assets/several-icons/wi-time-2.svg": "c7fb834b69f1da031391b19695f117c0",
"assets/assets/several-icons/wi-time-3.svg": "d7b2ce7636999c288435c6945afdab85",
"assets/assets/several-icons/wi-time-4.svg": "b2bdb0de184055efe2c5d2280601a97c",
"assets/assets/several-icons/wi-time-5.svg": "2276b7244c5dc82454c4964bf2ed0c18",
"assets/assets/several-icons/wi-time-6.svg": "6c5fe4b01404be6cfce4a211b0f03a99",
"assets/assets/several-icons/wi-time-7.svg": "b174ef309d89c35893d3e2d38fe58719",
"assets/assets/several-icons/wi-time-8.svg": "144f8713038163a72b1ff67dfbc7f499",
"assets/assets/several-icons/wi-time-9.svg": "86f2f985b52f318877e43c37937a6f4e",
"assets/assets/several-icons/wi-tornado.svg": "c5b4a7b731d354a42573365b05504f23",
"assets/assets/several-icons/wi-train.svg": "631abb68d682cf707930a490f8293f11",
"assets/assets/several-icons/wi-tsunami.svg": "0e8f7700b2660fa19354741f960b9d12",
"assets/assets/several-icons/wi-umbrella.svg": "e0979da9779be926c4042a1d91ddb046",
"assets/assets/several-icons/wi-volcano.svg": "a826f29be86a6273d3c1796afd895a44",
"assets/assets/several-icons/wi-wind-beaufort-0.svg": "e91b37f72a9ab1e9db06130e83f932b4",
"assets/assets/several-icons/wi-wind-beaufort-1.svg": "e8c53992b83b0bc80f7972b543ae9c6e",
"assets/assets/several-icons/wi-wind-beaufort-10.svg": "d979f0a82fa554458e13db0ec6b3ec83",
"assets/assets/several-icons/wi-wind-beaufort-11.svg": "bfd0311099f968b7ba783b772ed69e5d",
"assets/assets/several-icons/wi-wind-beaufort-12.svg": "85682cb6753a9d51f3ca9f9cce550cc0",
"assets/assets/several-icons/wi-wind-beaufort-2.svg": "d9ddbb84964292614592f2b156b19319",
"assets/assets/several-icons/wi-wind-beaufort-3.svg": "9582fbe88f2469bd91b64e52f0e06cff",
"assets/assets/several-icons/wi-wind-beaufort-4.svg": "8203e0dc64bb4b5799792afcdd2d06cc",
"assets/assets/several-icons/wi-wind-beaufort-5.svg": "e999d1c88dba2ca3bb7a1be4bbebbefd",
"assets/assets/several-icons/wi-wind-beaufort-6.svg": "cab0f775368f0b771d9853851924a079",
"assets/assets/several-icons/wi-wind-beaufort-7.svg": "3b54651965b657ce8b56f04082a3e0c5",
"assets/assets/several-icons/wi-wind-beaufort-8.svg": "6b4f833db9e039193a12f0b48b8b0fc7",
"assets/assets/several-icons/wi-wind-beaufort-9.svg": "0cace54932788d3775eff5a9858072e1",
"assets/assets/several-icons/wi-wind-deg.svg": "155d0f5869574ca3355d156cddf74be5",
"assets/assets/several-icons/wi-windy.svg": "56e49cd3e26af14007a5642cd119e0aa",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "23a500a4c92b1bb1277a0a61f1abe4d6",
"assets/NOTICES": "fcb782e08ca0e7d6d1c9fa6106a4cec0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "de8a56214ff5d0d48cbb840b96022d0c",
"/": "de8a56214ff5d0d48cbb840b96022d0c",
"main.dart.js": "bfb54f1f9dc8c963b67dfff412bad3d8",
"manifest.json": "0c07b872c24ec113d748253fdfa023f4",
"version.json": "2309b5587f3bba3e4de8bb3ca5a9c599",
"_redirects": "d38a2b58df330c85e0029eecf71d7c26"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
