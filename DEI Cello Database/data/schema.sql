START TRANSACTION;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS cello_pieces CASCADE;
DROP TABLE IF EXISTS cello_composers CASCADE;

CREATE TABLE cello_composers (
composer_id INT PRIMARY KEY,
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
piece_id INT PRIMARY KEY,
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
FOREIGN KEY (composer_id) REFERENCES cello_composers(composer_id)
-- FOREIGN KEY (suzuki_book_level_id) REFERENCES suzuki_book_levels(suzuki_book_level_id)
);

INSERT INTO cello_composers (composer_id, composer_name, composer_bio, wikipedia_article) VALUES
(1, 'Florence Beatrice Price', 'Florence Beatrice Price (1887-1953) was an African-American composer, arranger, and organist who was the first black woman to have a symphonic composition performed by a major American orchestra.', 'https://en.wikipedia.org/wiki/Florence_Price'),
(2, 'William Grant Still', 'William Grant Still (1895-1978) was an African-American composer known for his fusion of classical and popular music styles. He was the first black composer to conduct a symphony orchestra in the United States.', 'https://en.wikipedia.org/wiki/William_Grant_Still'),
(3, 'Samuel Coleridge-Taylor', 'Samuel Coleridge-Taylor (1875-1912) was an Afro-British composer who gained international fame for his choral work, "Hiawatha''s Wedding Feast." He was a pioneer in incorporating African elements into Western classical music.', 'https://en.wikipedia.org/wiki/Samuel_Coleridge-Taylor'),
(4, 'Rebecca Clarke', 'Rebecca Clarke (1886-1979) was an English composer and violist who was one of the first female professional orchestral players in England. She is known for her chamber music and solo works for viola and cello.', 'https://en.wikipedia.org/wiki/Rebecca_Clarke_(composer)'),
(5, 'David Baker', 'David Baker (1931-2016) was an African-American composer, educator, and jazz musician. He was a leading figure in jazz education and helped to establish jazz studies programs at several universities.', 'https://en.wikipedia.org/wiki/David_Baker_(composer)'),
(6, 'George Walker', 'George Walker (1922-2018) was an African-American composer and pianist who was the first black composer to win the Pulitzer Prize for Music. He was also a pioneer in electronic music.', 'https://en.wikipedia.org/wiki/George_Walker_(composer)'),
(7, 'Errollyn Wallen', 'Errollyn Wallen (b. 1958) is a British composer, pianist, and singer who has written works for a variety of genres, including opera, chamber music, and film scores. She was the first black woman to have a work performed at the Proms.', 'https://en.wikipedia.org/wiki/Errollyn_Wallen'),
(8, 'Ethel Smyth', 'Dame Ethel Smyth (1858-1944) was an English composer, writer, and suffragette. She is known for her operas, which were popular in the early 20th century, as well as her contributions to the women''s suffrage movement in England.', 'https://en.wikipedia.org/wiki/Ethel_Smyth'),
(9, 'Undine Smith Moore', 'Undine Smith Moore (1904-1989) was an African-American composer and educator who was a leading figure in the development of African-American art music. She was the first black woman to receive a doctorate in music from the Eastman School of Music.', 'https://en.wikipedia.org/wiki/Undine_Smith_Moore'),
(10, 'Margaret Bonds', 'Margaret Bonds (1913-1972) was an African-American composer and pianist who collaborated with Langston Hughes on several works, including the opera "Troubled Island." She was a leading figure in the development of art songs by black composers.', 'https://en.wikipedia.org/wiki/Margaret_Bonds'),
(11, 'Jessie Montgomery', 'Jessie Montgomery (b. 1981) is an American composer and violinist who is known for her chamber and orchestral works. She has been commissioned by a variety of organizations, including the New York Philharmonic.', 'https://en.wikipedia.org/wiki/Jessie_Montgomery'),
(12, 'Margaret Bonds', 'Margaret Bonds (1913-1972) was an African-American composer and pianist who collaborated with Langston Hughes on several works, including the opera "Troubled Island." She was a leading figure in the development of art songs by black composers.', 'https://en.wikipedia.org/wiki/Margaret_Bonds'),
(13, 'Amanda Maier', 'Amanda Maier (1853-1894) was a Swedish composer and violinist who studied with the famous Hungarian violinist Joseph Joachim. She is known for her chamber music and art songs, and was one of the first female composers to achieve recognition in Sweden. Despite her musical talent, Maier was discouraged from pursuing a career in music due to societal norms at the time. Her works were largely forgotten until the late 20th century, when renewed interest in women composers brought her music to a wider audience.', 'https://en.wikipedia.org/wiki/Amanda_Maier'),
(14, 'Augusta Holmès', 'Augusta Holmès (1847-1903) was a French composer of Irish descent. She was a prolific composer, known for her orchestral and choral works, and was considered by many to be a leading figure in French music during her lifetime. Despite her success, Holmès faced discrimination and obstacles due to her gender, including being denied admission to the Paris Conservatory. Her music often featured themes of mythology and nature, and she was particularly inspired by Irish folklore and the works of Shakespeare.', 'https://en.wikipedia.org/wiki/Augusta_Holmès'),
(15, 'Maud Powell', 'Maud Powell (1867-1920) was an American violinist and composer who played an important role in promoting American music during the late 19th and early 20th centuries. She was one of the first American musicians to achieve international recognition, and was known for her virtuosic playing style and commitment to promoting music by American composers. Powell also composed her own works, which were often inspired by American folk music and landscapes.', 'https://en.wikipedia.org/wiki/Maud_Powell'),
(16, 'Amy Beach', 'Amy Beach (1867-1944) was an American composer and pianist who was the first American woman to have a symphony performed by a major orchestra. She composed in a variety of genres, including art songs, chamber music, and orchestral works, and was particularly known for her piano music. Beach was a prominent figure in the Boston musical scene and was a member of several musical organizations, but faced criticism and discrimination due to her gender.', 'https://en.wikipedia.org/wiki/Amy_Beach'),
(17, 'Undine Smith Moore', 'Undine Smith Moore (1904-1989) was an American composer and music educator who was known for her works inspired by African American spirituals and folk music. She was a prominent figure in the Black Arts Movement of the 1960s and 1970s, and was a founder of the Black Music Center at Virginia State University. Moore received numerous awards and honors for her contributions to music, and her works continue to be performed and recorded today.', 'https://en.wikipedia.org/wiki/Undine_Smith_Moore'),
(18, 'Tomeka Reid', 'Tomeka Reid (b. 1977) is an American cellist, composer,
and improviser who is known for her unique and innovative approach to the cello. She has collaborated with a wide range of musicians and has been praised for her ability to blend different musical traditions, including jazz, classical, and experimental music. Reid has also been an advocate for underrepresented musicians, and has worked to promote diversity and inclusivity in the music industry.', 'https://en.wikipedia.org/wiki/Tomeka_Reid'),
(19, 'Hildegard von Bingen', 'Hildegard von Bingen (1098-1179) was a German Benedictine abbess, writer, composer, philosopher, and mystic. She is one of the best-known composers of sacred monophony and one of the earliest female composers whose music has been preserved. Although she primarily wrote liturgical music for voices, her compositions have been adapted and arranged for various instruments, including the cello.', 'https://en.wikipedia.org/wiki/Hildegard_of_Bingen'),
(20, 'Fanny Mendelssohn', 'Fanny Mendelssohn (1805-1847) was a German composer and pianist who composed over 460 pieces of music, including chamber music, piano works, and songs. She was the sister of the composer Felix Mendelssohn and was a talented musician in her own right, although her works were not widely recognized during her lifetime due to societal expectations for women at the time.', 'https://en.wikipedia.org/wiki/Fanny_Mendelssohn'),
(21, 'Lili Boulanger', 'Lili Boulanger (1893-1918) was a French composer known for her innovative and deeply emotional compositions. As a talented musician and the first female winner of the prestigious Prix de Rome composition prize in 1913, she made a significant impact on the world of classical music. Despite her short life, her music continues to be admired and performed today.', 'https://en.wikipedia.org/wiki/Lili_Boulanger'),
(22, 'Clara Schumann', 'Clara Schumann (1819-1896) was a German composer and pianist, known for her remarkable contributions to the Romantic era. As one of the most famous musicians of her time, she composed numerous works, including chamber music, piano solos, and songs. Despite facing gender-related prejudices, her music has endured and continues to be celebrated by musicians and audiences alike.', 'https://en.wikipedia.org/wiki/Clara_Schumann');


INSERT INTO cello_pieces (piece_id, piece_name, composer_id, suzuki_book_level_id, isArrangement, audio_link, sheet_music_link, publisher_info, description, technical_overview, is_public_domain, where_to_buy_or_download, duration) VALUES
(1, 'Three Pieces for Cello and Piano', 1, 9, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(2, 'Romance for Cello and Piano', 2, 6, true, 'https://example.com/piece1.mp3', 'https://imslp.org/wiki/5_Fantasiest%C3%BCcke,_Op.5_(Coleridge-Taylor,_Samuel)', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(3, 'Fantasy Pieces for Cello and Piano', 3, 7, true, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(4, 'Meditation for Cello and Piano', 4, 8, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(5, 'Suite for Cello and Piano', 5, 4, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(6, 'Lament for Cello and Piano', 6, 10, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(7, 'Sonata for Cello and Piano', 7, 5, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(8, 'Two Pieces for Cello and Piano', 8, 3, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(9, 'Impressions for Cello and Piano', 9, 10, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(10, 'Sonata for Cello and Piano', 10, 9, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(11, 'Quietude', 11, 2, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(12, 'Song Without Words', 1, 6, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(13, 'Lullaby', 2, 2, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(14, 'Berceuse', 13, 1, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(15, 'Elegy', 6, 8, false,'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(16, 'Little Suite for Cello and Piano', 6, 4, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(17, 'Melody', 2, 1, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(18, 'Berceuse', 14, 1, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(19, 'Cradle Song', 15, 2, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(20, 'Romance', 17, 3, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(21, 'Scales and Arpeggios for Cello', 1, 7, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(22, 'Cello Drones for Tuning and Improvisation', 18, 8, false, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'New July 2020 edition from 1965 original.', 'publisherInfo.example.com', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(23, 'Nobody Knows The Trouble Ive Seen', 1, 7, true, 'https://example.com/piece1.mp3', 'https://example.com/piece1.pdf', 'publisherInfo.example.com', 'New July 2020 edition from 1965 original.', 'Spiccato, thumb position, tempo changes, complex rhythms', false, 'composers.com, sheetmusicplus.com, imslp.com', '00:30:00'),
(24, 'Passacaglia on an Old English Tune', 4, 3, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'O Virtus Sapientiae (arranged for cello)', 19, 2, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Song without Words (arranged for cello)', 20, 2, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Nocturne for Cello and Piano', 21, 3, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Three Romances (arranged for cello)', 22, 4, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Cello Sonata in C minor, Op. 5', 8, 5, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;