import 'site_hub_screen.dart';

// Shared card data behind studio/library/arcade, and the pool the random
// generator (see random_screen.dart) draws from. Kept together here so that
// pool always matches what's actually shown on the three hub pages.

const studioCards = [
  SiteCardData(
    title: 'scaler',
    description: 'a tool to help musicians discover what key a song could be in',
    tags: ['music'],
    url: 'https://colleenkhm.github.io/scaler/',
  ),
  SiteCardData(
    title: 'just a word',
    description: 'a simple resource for looking up words',
    tags: ['words', 'writing'],
    url: 'https://www.just-a-word.com/',
  ),
  SiteCardData(
    title: 'freeCodeCamp',
    description: 'a non-profit resource with self-paced coding tutorials that walk you through building real projects',
    tags: ['code', 'learning'],
    url: 'https://www.freecodecamp.org/',
  ),
  SiteCardData(
    title: 'coolors',
    description: 'a color palette generator for finding and fine-tuning color schemes',
    tags: ['design', 'color'],
    url: 'https://coolors.co/',
  ),
  SiteCardData(
    title: 'inkarnate',
    description: 'a fantasy map-making tool for building worlds for stories, games, and campaigns',
    tags: ['design', 'worldbuilding'],
    url: 'https://inkarnate.com/',
  ),
  SiteCardData(
    title: 'rooms.xyz',
    description: 'a tool for designing and decorating virtual rooms with real furniture and decor',
    tags: ['design', 'interior'],
    url: 'https://rooms.xyz/',
  ),
  SiteCardData(
    title: 'anime.js',
    description: 'a lightweight JavaScript animation library for building smooth, complex web animations',
    tags: ['code', 'animation'],
    url: 'https://animejs.com/',
  ),
  SiteCardData(
    title: 'bandlab',
    description: 'a free, cloud-based studio for recording, mixing, and collaborating on music online',
    tags: ['music', 'tool'],
    url: 'https://www.bandlab.com',
  ),
  SiteCardData(
    title: 'musicca tuner',
    description: 'a simple online tuner for getting your instrument in tune',
    tags: ['music', 'tool'],
    url: 'https://www.musicca.com/tuner',
  ),
  SiteCardData(
    title: 'tailornova',
    description: 'an online fashion design tool for visualizing garments in 3D and generating custom-fitted sewing patterns',
    tags: ['design', 'tool', 'fashion'],
    url: 'https://tailornova.com/',
  ),
];

const libraryCards = [
  SiteCardData(
    title: 'earth',
    description: 'an interactive global weather map',
    tags: ['science', 'geography'],
    url: 'https://earth.nullschool.net/',
  ),
  SiteCardData(
    title: 'library of babel',
    description: 'a virtual replication of the fictional library of babel',
    tags: ['literature', 'myth'],
    url: 'https://libraryofbabel.info/',
  ),
  SiteCardData(
    title: 'space elevator',
    description: 'a virtual expedition from earth to outer space',
    tags: ['science', 'space'],
    url: 'https://neal.fun/space-elevator/',
  ),
  SiteCardData(
    title: 'the deep sea',
    description: 'a virtual expedition down to the bottom of the sea',
    tags: ['science', 'ocean'],
    url: 'https://neal.fun/deep-sea/',
  ),
  SiteCardData(
    title: 'size of space',
    description: 'an interactive visualization of outer space',
    tags: ['science', 'space'],
    url: 'https://neal.fun/size-of-space/',
  ),
  SiteCardData(
    title: 'radio garden',
    description: 'spin a virtual globe and tune into live radio stations from cities around the world',
    tags: ['language', 'radio', 'world'],
    url: 'https://radio.garden/',
  ),
  SiteCardData(
    title: 'same energy',
    description: 'use an image to search for other images with similar energy',
    tags: ['art', 'design', 'tool'],
    url: 'https://same.energy/',
  ),
  SiteCardData(
    title: 'random street view',
    description: 'drops you into a random street view somewhere around the world',
    tags: ['geography', 'travel'],
    url: 'https://randomstreetview.com/',
  ),
  SiteCardData(
    title: 'etymonline',
    description: 'look up a word to learn about its origins and adaptations over time',
    tags: ['language', 'history'],
    url: 'https://www.etymonline.com/',
  ),
  SiteCardData(title: 'monkeytype', description: 'a minimal, customizable typing test', tags: ['skill', 'test'], url: 'https://monkeytype.com/'),
  SiteCardData(
    title: 'ventusky',
    description: 'an animated, interactive map of global weather - wind, temperature, pressure, and more',
    tags: ['weather', 'geography'],
    url: 'https://www.ventusky.com/#p=48.5;-94.5;5',
  ),
  SiteCardData(
    title: 'mondrian and me',
    description: 'generates a unique piece of art in the style of Piet Mondrian, just for you',
    tags: ['art', 'generative', 'interactive'],
    url: 'https://mondrianandme.com/',
  ),
  SiteCardData(
    title: 'click the red button',
    description: 'a big red button that dares you to click it',
    tags: ['novelty'],
    url: 'https://clicktheredbutton.com/',
  ),
  SiteCardData(
    title: 'the useless web',
    description: 'sends you to a random, delightfully useless website every time you press the button',
    tags: ['novelty', 'random'],
    url: 'https://theuselessweb.com/',
  ),
  SiteCardData(
    title: 'onezoom',
    description: 'an interactive, zoomable tree of life showing how every species is related',
    tags: ['science', 'biology'],
    url: 'https://www.onezoom.org/',
  ),
  SiteCardData(
    title: 'worldwide telescope',
    description: 'an interactive, zoomable atlas of the night sky built from real telescope imagery',
    tags: ['science', 'space'],
    url: 'https://worldwidetelescope.org/',
  ),
  SiteCardData(
    title: 'the true size of',
    description: 'lets you drag countries around a world map to compare their real size, since flat maps distort it',
    tags: ['geography'],
    url: 'https://thetruesize.com/',
  ),
  SiteCardData(
    title: 'information is beautiful',
    description: 'a collection of striking data visualizations that turn complex topics into clear graphics',
    tags: ['data', 'design'],
    url: 'https://informationisbeautiful.net/',
  ),
  SiteCardData(
    title: 'typelit',
    description: 'a typing practice tool that has you type out passages from classic literature',
    tags: ['typing', 'literature'],
    url: 'https://www.typelit.io/',
  ),
  SiteCardData(
    title: 'keybr',
    description: 'an adaptive typing tutor that builds custom lessons to target your weak keys',
    tags: ['typing', 'skill'],
    url: 'https://www.keybr.com/',
  ),
  SiteCardData(
    title: 'line mode browser',
    description: "a recreation of the world's first website and browser, hosted at CERN where the web was born",
    tags: ['history', 'internet'],
    url: 'https://line-mode.cern.ch/www/hypertext/WWW/TheProject.html',
  ),
  SiteCardData(
    title: 'all that\'s interesting',
    description: 'a trove of offbeat articles on history, oddities, and the stranger corners of the world',
    tags: ['history', 'trivia'],
    url: 'https://allthatsinteresting.com/',
  ),
  SiteCardData(
    title: 'looper',
    description: 'entertainment and pop culture explainers on movies, TV, and celebrity news',
    tags: ['entertainment', 'movies'],
    url: 'https://www.looper.com/',
  ),
  SiteCardData(
    title: 'emoticon hub',
    description: 'a browsable library of emoticons and kaomoji ready to copy and paste',
    tags: ['novelty', 'internet culture'],
    url: 'https://emoticonhub.com/',
  ),
  SiteCardData(
    title: 'eel slap',
    description: 'lets you slap a man in the face with an eel, repeatedly, for no reason',
    tags: ['novelty', 'silly'],
    url: 'http://eelslap.com/',
  ),
  SiteCardData(
    title: 'pointer pointer',
    description: 'shows you a photo of someone pointing at wherever your cursor happens to be',
    tags: ['novelty', 'silly'],
    url: 'https://pointerpointer.com/',
  ),
  SiteCardData(
    title: 'where do i eat lmao',
    description: 'helps you decide where to eat when you just cannot decide',
    tags: ['novelty', 'food'],
    url: 'https://where-do-i-eat-lmao.vercel.app/',
  ),
  SiteCardData(
    title: 'staggering beauty',
    description: 'a wobbly, screaming worm you can fling around the screen with your mouse',
    tags: ['novelty', 'silly'],
    url: 'http://www.staggeringbeauty.com/',
  ),
  SiteCardData(
    title: 'runpee',
    description: 'tells you the best moments to step out during a movie without missing anything important',
    tags: ['movies', 'tool'],
    url: 'https://runpee.com/',
  ),
  SiteCardData(
    title: 'australian museum: animals',
    description: 'profiles of Australian wildlife with facts, photos, and identification guides',
    tags: ['science', 'animals'],
    url: 'https://australian.museum/learn/animals/',
  ),
  SiteCardData(
    title: 'reverse dictionary',
    description: 'describe the concept you mean and it finds the word you are looking for',
    tags: ['words', 'language'],
    url: 'https://reversedictionary.org/',
  ),
  SiteCardData(
    title: 'because recollection: metronomy',
    description: 'an interactive audio-visual trip through Metronomy\'s music, part of Because Music\'s 10-year anniversary project',
    tags: ['music', 'interactive'],
    url: 'http://because-recollection.com/metronomy',
  ),
  SiteCardData(
    title: 'cameron\'s world',
    description: 'a nostalgic collage of animated gifs and text excavated from archived GeoCities pages',
    tags: ['nostalgia', 'internet culture'],
    url: 'https://www.cameronsworld.net/',
  ),
  SiteCardData(
    title: 'million dollar homepage',
    description: 'a graphic time capsule of the internet in 2005, built pixel by pixel from a million purchased ad squares',
    tags: ['internet culture', 'history'],
    url: 'https://milliondollarhomepage.com/',
  ),
  SiteCardData(
    title: 'ripples',
    description: 'an interactive WebGL water simulation that ripples wherever you click and drag',
    tags: ['interactive', 'simulation'],
    url: 'https://nicopowa.github.io/ripples3/',
  ),
  SiteCardData(
    title: 'line 05x6',
    description: 'a hypnotic generative line animation from Chris Shier\'s long-running line art series',
    tags: ['generative', 'art', 'interactive'],
    url: 'https://csh.bz/line/05x6.html',
  ),
];

const arcadeCards = [
  SiteCardData(
    title: 'fancy pants adventure',
    description: 'a side-scrolling platformer starring a stick-figure in fancy pants, known for its fluid running and jumping',
    tags: ['side-scroller', 'platformer', 'game', 'nostalgia'],
    url: 'https://www.newgrounds.com/portal/view/301341',
  ),
  SiteCardData(
    title: 'geotastic',
    description: 'drops you into a random Street View location and challenges you to guess where in the world you are',
    tags: ['geography', 'travel'],
    url: 'https://geotastic.net/home',
  ),
  SiteCardData(
    title: 'worldle',
    description: 'a daily guessing game where you identify a country from its silhouette',
    tags: ['geography', 'game'],
    url: 'https://worldle.teuteuf.fr/',
  ),
  SiteCardData(
    title: 'language guesser',
    description: 'plays a short music video clip and challenges you to guess what language is being spoken',
    tags: ['language', 'music'],
    url: 'https://languageguesser.com/en',
  ),
  SiteCardData(
    title: 'redactle',
    description: 'uncovers a redacted Wikipedia article one guessed word at a time until you can identify the topic',
    tags: ['words', 'history'],
    url: 'https://redactle.net/',
  ),
  SiteCardData(
    title: 'contexto',
    description: 'a daily word-guessing game that scores each guess by how semantically close it is to the secret word',
    tags: ['words', 'game'],
    url: 'https://contexto.me/',
  ),
  // No url yet - not confident in a current, correct link for this one.
  SiteCardData(
    title: 'a dark room',
    description: 'a minimalist text-based survival game that starts with just a dying fire and grows into an exploration of what lies beyond',
    tags: ['minimalist', 'survival', 'game'],
    url: 'https://adarkroom.doublespeakgames.com/',
  ),
  SiteCardData(
    title: 'level devil',
    description: 'a side-scrolling platformer that attempts to infuriate the player by throwing in tricks and traps',
    tags: ['side-scroller', 'platformer', 'game'],
    url: 'https://leveldevilfull.com/',
  ),
  SiteCardData(
    title: 'idea games',
    description: 'a collection of mini games',
    tags: ['novelty', 'game'],
    url: 'https://www.ideagames.fun/',
  ),
  SiteCardData(
    title: 'anthropeum',
    description: 'ranked competition game where you are shown an artifact and have to guess its origin',
    tags: ['history', 'archaeology', 'game'],
    url: 'https://anthropeum.com/',
  ),
  SiteCardData(
    title: 'zanagrams',
    description: 'a daily word game where you connect letters to create words',
    tags: ['words', 'puzzle', 'game'],
    url: 'https://zanagrams.com/',
  ),
  SiteCardData(
    title: 'sandboxels',
    description: 'a falling-sand physics sandbox with hundreds of elements that react, burn, and combine',
    tags: ['sandbox', 'simulation', 'creativity'],
    url: 'https://neal.fun/sandboxels/',
  ),
  SiteCardData(
    title: 'cook',
    description: 'a sandbox for chopping, mixing, and cooking up whatever dish you can imagine',
    tags: ['sandbox', 'cooking'],
    url: 'https://r74n.com/cook/',
  ),
  SiteCardData(
    title: 'zen garden',
    description: 'a relaxing digital zen garden you can rake and rearrange with your cursor',
    tags: ['relaxation', 'sandbox', 'simulation', 'creative'],
    url: 'https://paint.toys/zen-garden/',
  ),
  SiteCardData(
    title: 'particle garden',
    description: 'a falling-particle sandbox where you paint with elements and watch them react and interact',
    tags: ['sandbox', 'simulation', 'creative'],
    url: 'https://www.particlegarden.com/',
  ),
];

const allSiteCards = [...studioCards, ...libraryCards, ...arcadeCards];
