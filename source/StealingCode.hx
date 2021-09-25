/*

Leaving a note here because I ste- I mean... "Borrow" code that I think would fit/improve the game.
Or maybe I just wanted to experiment with the code to see how it works, it is a learning experience after all.
And safe to say that throughout this solo development coding wise, I learned a lot, not only in Haxe but programming structure as a whole.
Guess this modding experience is gonna pay off when I actually try to make an actual game in Godot or something.

Anyway, here are some credits:

Splash note code - reused for sparkle notes
sourced from: Mic'd Up Engine https://github.com/Verwex/Funkin-Mic-d-Up-SC/blob/stable/source/PlayState.hx#L4280
Can't figure out how to make it run an animation based on the note color so I remade it to the "sparkles' that I went with.

Skipping cutscene by holding button
sourced from: Bob and Bosip https://github.com/ash237/vs-Bob-and-Bosip/blob/V1.1.2/source/VideoState.hx#L236
Not being to skip cutscenes suck, so... yoink.

Memory Usage Issues
sourced from: Pull Request #1083 https://github.com/ninjamuffin99/Funkin/pull/1083/commits/160552215b07aaf8eec5f413e25c76898cc108e4
Saw this while browsing the pull request section and I thought it will greatly improve the performance, so I added it.

Note type chart code - reused for note-based alt animations
sourced from: Bob and Bosip https://github.com/ash237/vs-Bob-and-Bosip/blob/V1.1.2/source/ChartingState.hx#L1446-L1473
Technically not stolen code because I actually did most of the code on my own based on what I learned.
I just used this as a stepping stone and reference to do it. While the note type string in Bob and Bosip is used to mark a
curStep for code execution, mine simply uses it in a way that the string attatched to the notedata is appended in the BF/Dad sprite animations.
Originally only used modcharts to changeBoyfriendCharacter into different alternate animations, but it looks way too janky for my perfectionist brain
that decided to fucking spend 2 days coding something I'll probs only use once or twice... Story of my life.

Letter ranks saving and viewable in Freeplay
sourced from: Pull Request #898 (KE) https://github.com/KadeDev/Kade-Engine/pull/898
Heavily modified to fit my style. Made it save letter ranks instead of the GFC, SDCB shit. Then after a while I considered adding an FC case.
Utilized the FC bool in PlayState to detect an FC, and if it returns true, it overwrites the letter rankings except SS ofc.
Also made FCs that ranks S+ & S++ display SFC (Superior Full Combo) instead, and ofc, SS (Pure Perfect) gets the highest priority.
Since the original pull was already merged in Kade Engine, I just feel like this system I made is way more better, though as a noobie, might be inefficient.

Freeplay Delay
sourced from: Pull Request #540 https://github.com/ninjamuffin99/Funkin/pull/540
Got tired of having to load all the songs scrolling down the freeplay menu causing about seconds worth of delay when I only wanna test one song.
Nothing special... just that.

*/