import 'package:flutter/material.dart';
import 'site_hub_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(
            cards: [
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
          title: 'floor796',
          description: 'an enormous, painstakingly illustrated floor of a fictional building packed with tiny scenes to discover',
          tags: ['art', 'illustration'],
          url: 'https://floor796.com/',
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
      ],
    );
  }
}
