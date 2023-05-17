START TRANSACTION;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS cello_pieces CASCADE;
DROP TABLE IF EXISTS cello_composers CASCADE;

CREATE TABLE cello_composers (
    composer_id SERIAL PRIMARY KEY,
    composer_name VARCHAR(255),
    composer_bio TEXT,
    wikipedia_article VARCHAR(255)
);

CREATE TABLE users (
    user_id SERIAL,
    username varchar(50) NOT NULL UNIQUE,
    password_hash varchar(200) NOT NULL,
    role varchar(50) NOT NULL,
    CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE cello_pieces (
    piece_id SERIAL PRIMARY KEY,
    piece_name VARCHAR(255),
    composer_id INT,
    suzuki_book_level_id INT,
    isArrangement boolean,
    audio_link TEXT,
    sheet_music_link TEXT,
    publisher_info TEXT,
    description TEXT,
    technical_overview TEXT,
    is_public_domain boolean, 
    where_to_buy_or_download TEXT, 
    duration TIME,
    coverImage TEXT,
    FOREIGN KEY (composer_id) REFERENCES cello_composers(composer_id)
    -- FOREIGN KEY (suzuki_book_level_id) REFERENCES suzuki_book_levels(suzuki_book_level_id)
);

INSERT INTO cello_composers (composer_id, composer_name, composer_bio, wikipedia_article) VALUES
('Florence Beatrice Price', 'Florence Beatrice Price (1887-1953) was an African-American composer, arranger, and organist who was the first black woman to have a symphonic composition performed by a major American orchestra.', 'https://en.wikipedia.org/wiki/Florence_Price'),
('William Grant Still', 'William Grant Still (1895-1978) was an African-American composer known for his fusion of classical and popular music styles. He was the first black composer to conduct a symphony orchestra in the United States.', 'http://www.williamgrantstillmusic.com/BiographicalNotes.htm'),
('Samuel Coleridge-Taylor', 'Samuel Coleridge-Taylor (1875-1912) was an Afro-British composer who gained international fame for his choral work, "Hiawatha''s Wedding Feast." He was a pioneer in incorporating African elements into Western classical music.', 'https://en.wikipedia.org/wiki/Samuel_Coleridge-Taylor'),
('Rebecca Clarke', 'Rebecca Clarke (1886-1979) was an English composer and violist who was one of the first female professional orchestral players in England. She is known for her chamber music and solo works for viola and cello.', 'https://en.wikipedia.org/wiki/Rebecca_Clarke_(composer)'),
('David Baker', 'David Baker (1931-2016) was an African-American composer, educator, and jazz musician. He was a leading figure in jazz education and helped to establish jazz studies programs at several universities.', 'https://en.wikipedia.org/wiki/David_Baker_(composer)'),
('George Walker', 'George Walker (1922-2018) was an African-American composer and pianist who was the first black composer to win the Pulitzer Prize for Music. He was also a pioneer in electronic music.', 'https://georgetwalker.com/bio.html'),
('Errollyn Wallen', 'Errollyn Wallen (b. 1958) is a British composer, pianist, and singer who has written works for a variety of genres, including opera, chamber music, and film scores. She was the first black woman to have a work performed at the Proms.', 'https://en.wikipedia.org/wiki/Errollyn_Wallen'),
('Ethel Smyth', 'Dame Ethel Smyth (1858-1944) was an English composer, writer, and suffragette. She is known for her operas, which were popular in the early 20th century, as well as her contributions to the women''s suffrage movement in England.', 'https://en.wikipedia.org/wiki/Ethel_Smyth'),
('Undine Smith Moore', 'Undine Smith Moore (1904-1989) was an African-American composer and educator who was a leading figure in the development of African-American art music. She was the first black woman to receive a doctorate in music from the Eastman School of Music.', 'https://en.wikipedia.org/wiki/Undine_Smith_Moore'),
('Margaret Bonds', 'Margaret Bonds (1913-1972) was an African-American composer and pianist who collaborated with Langston Hughes on several works, including the opera "Troubled Island." She was a leading figure in the development of art songs by black composers.', 'https://en.wikipedia.org/wiki/Margaret_Bonds'),
('Jessie Montgomery', 'Jessie Montgomery (b. 1981) is an American composer and violinist who is known for her chamber and orchestral works. She has been commissioned by a variety of organizations, including the New York Philharmonic.', 'https://en.wikipedia.org/wiki/Jessie_Montgomery'),
('Margaret Bonds', 'Margaret Bonds (1913-1972) was an African-American composer and pianist who collaborated with Langston Hughes on several works, including the opera "Troubled Island." She was a leading figure in the development of art songs by black composers.', 'https://en.wikipedia.org/wiki/Margaret_Bonds'),
('Amanda Maier', 'Amanda Maier (1853-1894) was a Swedish composer and violinist who studied with the famous Hungarian violinist Joseph Joachim. She is known for her chamber music and art songs, and was one of the first female composers to achieve recognition in Sweden. Despite her musical talent, Maier was discouraged from pursuing a career in music due to societal norms at the time. Her works were largely forgotten until the late 20th century, when renewed interest in women composers brought her music to a wider audience.', 'https://en.wikipedia.org/wiki/Amanda_Maier'),
('Augusta Holmès', 'Augusta Holmès (1847-1903) was a French composer of Irish descent. She was a prolific composer, known for her orchestral and choral works, and was considered by many to be a leading figure in French music during her lifetime. Despite her success, Holmès faced discrimination and obstacles due to her gender, including being denied admission to the Paris Conservatory. Her music often featured themes of mythology and nature, and she was particularly inspired by Irish folklore and the works of Shakespeare.', 'https://en.wikipedia.org/wiki/Augusta_Holmès'),
('Maud Powell', 'Maud Powell (1867-1920) was an American violinist and composer who played an important role in promoting American music during the late 19th and early 20th centuries. She was one of the first American musicians to achieve international recognition, and was known for her virtuosic playing style and commitment to promoting music by American composers. Powell also composed her own works, which were often inspired by American folk music and landscapes.', 'https://en.wikipedia.org/wiki/Maud_Powell'),
('Amy Beach', 'Amy Beach (1867-1944) was an American composer and pianist who was the first American woman to have a symphony performed by a major orchestra. She composed in a variety of genres, including art songs, chamber music, and orchestral works, and was particularly known for her piano music. Beach was a prominent figure in the Boston musical scene and was a member of several musical organizations, but faced criticism and discrimination due to her gender.', 'https://en.wikipedia.org/wiki/Amy_Beach'),
('Undine Smith Moore', 'Undine Smith Moore (1904-1989) was an American composer and music educator who was known for her works inspired by African American spirituals and folk music. She was a prominent figure in the Black Arts Movement of the 1960s and 1970s, and was a founder of the Black Music Center at Virginia State University. Moore received numerous awards and honors for her contributions to music, and her works continue to be performed and recorded today.', 'https://en.wikipedia.org/wiki/Undine_Smith_Moore'),
('Tomeka Reid', 'Tomeka Reid (b. 1977) is an American cellist, composer,
and improviser who is known for her unique and innovative approach to the cello. She has collaborated with a wide range of musicians and has been praised for her ability to blend different musical traditions, including jazz, classical, and experimental music. Reid has also been an advocate for underrepresented musicians, and has worked to promote diversity and inclusivity in the music industry.', 'https://en.wikipedia.org/wiki/Tomeka_Reid'),
('Hildegard von Bingen', 'Hildegard von Bingen (1098-1179) was a German Benedictine abbess, writer, composer, philosopher, and mystic. She is one of the best-known composers of sacred monophony and one of the earliest female composers whose music has been preserved. Although she primarily wrote liturgical music for voices, her compositions have been adapted and arranged for various instruments, including the cello.', 'https://en.wikipedia.org/wiki/Hildegard_of_Bingen'),
('Fanny Mendelssohn', 'Fanny Mendelssohn (1805-1847) was a German composer and pianist who composed over 460 pieces of music, including chamber music, piano works, and songs. She was the sister of the composer Felix Mendelssohn and was a talented musician in her own right, although her works were not widely recognized during her lifetime due to societal expectations for women at the time.', 'https://en.wikipedia.org/wiki/Fanny_Mendelssohn'),
('Lili Boulanger', 'Lili Boulanger (1893-1918) was a French composer known for her innovative and deeply emotional compositions. As a talented musician and the first female winner of the prestigious Prix de Rome composition prize in 1913, she made a significant impact on the world of classical music. Despite her short life, her music continues to be admired and performed today.', 'https://en.wikipedia.org/wiki/Lili_Boulanger'),
('Clara Schumann', 'Clara Schumann (1819-1896) was a German composer and pianist, known for her remarkable contributions to the Romantic era. As one of the most famous musicians of her time, she composed numerous works, including chamber music, piano solos, and songs. Despite facing gender-related prejudices, her music has endured and continues to be celebrated by musicians and audiences alike.', 'https://en.wikipedia.org/wiki/Clara_Schumann'),
('Natalja Baklanova', 'Baklanova, Nataliya Vladimirovna (1897-1980) violinist, violin teacher, played for many years in the orchestra of the Moscow Art Theatre and lived nearby at Nemirovich-Danchenko Street; daughter of the wealthy owner of a large textile factory Vladimir Baklanov (1865-1920) and Olga Aleksandra Reshetnikov (1870-1950); sister of the Hollywood actress Olga Baklanova and colonel general Gleb Baklanov', 'https://en.wikipedia.org/wiki/Natalja_Baklanova'),
('Melanie Bonis', 'Melanie Bonis (1858-1937) was a French composer and pianist who wrote over 300 works, including chamber music, piano pieces, and songs. Despite facing societal prejudices against women in music during her lifetime, Bonis continued to compose and publish her works under the pseudonym "Mel Bonis". She was known for her lush harmonies and use of impressionistic techniques, and her music has gained greater recognition in recent years.', 'https://en.wikipedia.org/wiki/Mel_Bonis'),
('Ina Boyle', 'Ina Boyle (1889–1967) was an Irish composer of the 20th century, considered one of the most significant female composers in Ireland. Her extensive body of work includes orchestral music, chamber music, choral music, and songs. Despite the challenges of being a woman in a male-dominated field and the geographical isolation of living in rural Ireland, Boyle remained dedicated to her craft throughout her life. Her music, known for its unique blend of Romantic and early 20th-century modernist styles, is characterized by its emotional depth and intricate textures. In the years since her death, her music has been increasingly performed and recognized for its importance in the canon of Irish classical music.', 'https://www.inaboyle.org/biography-1'),
('Tania León', 'Tania León (b. 1943) is a Cuban-born composer, conductor, and educator known for her innovative works that blend diverse musical traditions. She has been recognized with numerous awards and honors, including the Guggenheim Fellowship and the ASCAP Victor Herbert Award. León has composed for various ensembles, including orchestras, chamber groups, and vocalists. Her music often explores themes of cultural identity, social justice, and the African diaspora. She is also an advocate for music education and has worked with several youth orchestras and educational institutions.', 'https://www.tanialeon.com/about');

INSERT INTO cello_pieces (piece_name, composer_id, suzuki_book_level_id, isArrangement, audio_link, sheet_music_link, publisher_info, description, technical_overview, is_public_domain, where_to_buy_or_download, duration, coverImage) VALUES
('Adoration', 1, 6, true, 'https://www.youtube.com/watch?v=Qbz0XmbjfDw', 'https://www.johnsonstring.com/cgi-bin/music/scripts/violin-viola-cello-music.cgi?itemno=CEPRICADORATSCH&srsltid=AR57-fC6u9mSA6UkEGl2_SvC0dP5UTmxE2RLY7LOElLU33M9ApH76MWR4Eg', 'G. Schirmer', 'Price''s Adoration is a short, late work, originally written for organ to be used in church services. Its gorgeous, lyrical melodies and its approachability have made it popular in other arrangements, such as this one for cello and piano.','Rubato, sustain, neck positions', false, 'sheetmusicplus.com, johnsonstring.com', '00:05:00','https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ-rKyuVXxUJ9PCDSr4JsMbjYsMkUm17C0JhNxpTogIMQdMNWIrcm8QCIqx3s7dxB-QPUy_MdnZU41581jGmUpkorfsq20k0CTtcTwhJw&usqp=CAE'),
('Summerland', 2, 7, true, 'https://www.youtube.com/watch?v=GkFsch7DMLU', 'http://www.williamgrantstillmusic.com/WorksforSoloInstrumentsandPiano.htm', 'William Grant Still Music Publishing', 'An excerpt from THREE VISIONS for piano.', 'Thumb position, rubato, sustain', false, 'williamgrantstill.com', '00:04:48','https://www.tfront.com/images/product/icon/517696.jpg'),
('Variations for Cello and Piano', 3, 8, false, 'https://www.youtube.com/watch?v=e8pfpdsDNPI', 'https://imslp.org/wiki/Variations_for_Cello_and_Piano_(Coleridge-Taylor,_Samuel)', 'Edition Silvertrust', 'The Variations though composed in 1905 were not published until 1918 as they were lost for several years. Here Coleridge-Taylor''s compositional skills are readily on display as he takes an ordinary theme and creates a set of brilliant and highly appealing variations. Essentially, there are four self-contained movements, (Allegro, Allegro, Larghetto and Vivace) each with a different mood. Our soundbite presents about a quarter of the work.', 'Thumb position, tempo changes, complex rhythms, key changes, fast tempos', true, 'https:editionsilvertrust.com, sheetmusicplus.com, imslp.com', '00:13:00','https://www.tempopress.com/wp-content/uploads/2019/11/Variations-in-b-minor-768x1024.jpg'),
('Suite for Cello and Jazz Trio', 5, 4, false, 'https://www.youtube.com/watch?v=2s4d_0b89uw', 'http://store.subitomusic.com/index.php?main_page=product_info&products_id=381', 'Dunsinane Music Publishing', NULL, 'Professional level piece - very challenging!', false, 'subitomusic.com, sheetmusicplus.com', '00:16:50','https://store.subitomusic.com/images/90340030i.jpg'),
('Sonata for Cello and Piano', 6, 10, false, 'https://www.youtube.com/watch?v=gncpdZQ7xZM', 'https://www.ficksmusic.com/products/walker-cello-sonata-keiser?gclid=Cj0KCQjw9deiBhC1ARIsAHLjR2Dt2zRpT3mxWbAgQ59eqpy-DHAOTZbIyNVrYf6tg_NIbCGlwRmRCs0aAu63EALw_wcB', 'Lauren Keiser Music Publishing', '"This sonata is truly one of the lesser-known masterpieces of the repertoire, yet it is not taught, let alone even considered for audition rep for conservatories and universities. It is a treasure and needs to be repositioned in the American classical-music canon, so I continue to speak of it and champion it so that younger and older cellists alike may be inspired by its brilliance." - Seth Parker Woods', 'Professional level piece', false, 'ficksmusic.com', '00:16:00','https://cdn.shopify.com/s/files/1/0900/1828/products/X531012_2000x.jpg?v=1678800516'),
('Sonata for Cello and Piano', 7, 5, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Two Pieces for Cello and Piano', 8, 3, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Impressions for Cello and Piano', 9, 10, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Sonata for Cello and Piano', 10, 9, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Quietude', 11, 2, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Song Without Words', 1, 6, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Lullaby', 2, 2, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Berceuse', 13, 1, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Elegy', 6, 8, false,'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Little Suite for Cello and Piano', 6, 4, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Melody', 2, 1, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Berceuse', 14, 1, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Cradle Song', 15, 2, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Romance', 17, 3, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Scales and Arpeggios for Cello', 1, 7, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
-- ('Cello Drones for Tuning and Improvisation', 18, 8, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'New July 2020 edition from 1965 original.', 'publisherInfo.example.com', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00','https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Nobody Knows The Trouble Ive Seen', 1, 7, true, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00', 'https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Passacaglia on an Old English Tune', 4, 3, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('O Virtus Sapientiae (arranged for cello)', 19, 2, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Song without Words (arranged for cello)', 20, 2, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Nocturne for Cello and Piano', 21, 3, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Three Romances (arranged for cello)', 22, 4, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Cello Sonata in C minor, Op. 5', 8, 5, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'https://images.reverb.com/image/upload/s--sAUKU3hP--/a_0/f_auto,t_large/v1680541140/raohzxakqetlzwpg7ac4.jpg'),
('Melodic Exercises to Changes of Position', 23, 4, false, NULL, 'https://www.metzlerviolins.com/baklanova-nataljadallamos-melodic-exercisescello-p.html', 'Edito Musica Budapest', 'Intermediate exercises for practicing position changes', NULL, false, 'metzlerviolins.com, musicshopeurope.com', NULL,'https://cdn.shoplightspeed.com/shops/629006/files/14860296/430x510x3/hal-leonard-baklanova-natalja-dallamos-melodic-exe.jpg'),
('Serenade', 24, 5, false, 'https://www.youtube.com/watch?v=w_4EB2lUlqo', 'https://www.prestomusic.com/sheet-music/products/8861716--mel-bonis-serenade-pour-violoncelle-et-piano', 'Editions Musicales Fortin-Armiane', 'Mel Bonis’s Sérénade was published by Leduc in 1899, a year marked by a wealth of new publications, since Marionnettes, Barcarolle-Étude, Regina cœli and Prière de Noël (on a poem by Amédée-Louis Hettich) also appeared in print that same year.  Dedicated to the cellist Marguerite Chaigneau (1875–1943), the piece can also be played on the violin. It reveals Mel Bonis’s fondness for individual genre pieces inherited from the Romantics (barcarolle, impromptu, ballade, etc.), the inspiration of which remains vague. Cast in an ABA’ form, the Sérénade presents no particular technical difficulties and belongs to the sphere of “home music”, meant to be played among family or friends. It leaves the cello almost always in the foreground and gives it all the cantabile expression, though the piano at times ventures into dialogue. But it also reveals the composer’s ambivalence, wavering between the conventions of the salon piece and the desire to introduce more personal accents: alongside the melodic charm, the conventional harmonies, the succession of phrases built on the same rhythmic scheme, one discovers richer chords and unexpected modulations (such as the one into A flat major, a tritone apart from the home key, D major), while the five or six-bar phrases disrupt the four-square symmetry. These are the moments when the piano abandons its strict role as an accompanist and becomes more melodic. Source: http://www.bruzanemediabase.com/', NULL, false, 'prestomusic.com, sheetmusicplus.com', '00:04:00', 'https://d29ci68ykuu27r.cloudfront.net/items/21905497/cover_images/cover-medium_large_file.png'),
('Allegretto Grazioso', 23, 3, false, NULL, 'https://www.sheetmusicplus.com/title/repertoire-album-sheet-music/4991192?ac=1&aff_id=453001', 'Edito Musica Budapest', 'This piece is part of a larger anthology containing easy (approx. book 2-4) songs for cellists', 'Varied slur patterns, stays in first position, some articulation changes', false, 'sheetmusicplus.com, emb.hu', '00:01:10', 'https://d29ci68ykuu27r.cloudfront.net/items/4991192/cover_images/cover-medium_large_file.png'),
('Mazurka', 23, 2, false, 'https://www.youtube.com/watch?v=aioZzcgW6BE', 'https://www.kotta.info/en/product/2417/PERFORMANCE-PIECES-FOR-VIOLONCELLO-WITH-PIANO-ACCOMPANIMENT-1', 'Edito Musica Budapest', 'This piece is part of a larger anthology containing easy (approx. book 2-4) songs for cellists', 'Varied rhythms, varied slur patterns, dynamic changes', false, 'emb.hu', '00:1:50', 'https://www.kotta.info/media/24/2417/b1_tn_f.jpg' ),
('The Stones are Very Hard from Twelve Negro Melodies, Op. 59 No. 2', 3, 4, true, NULL, 'https://imslp.org/wiki/24_Negro_Melodies%2C_Op.59_(Coleridge-Taylor%2C_Samuel)', NULL, 'Arranged by Samuel Araya, 2021. Originally from 24 Negro Melodies, Op.59 for piano solo', NULL, true, 'imslp.com', '00:02:30', 'https://cdn.imslp.org/images/thumb/pdfs/80/dc816bf26f8881e80b9e7d1874b624e53c471770.png');



COMMIT;