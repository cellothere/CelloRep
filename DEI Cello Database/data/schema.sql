START TRANSACTION;

DROP TABLE IF EXISTS cello_piece_audio CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS cello_pieces CASCADE;
DROP TABLE IF EXISTS cello_composers CASCADE;
DROP TABLE IF EXISTS suzuki_book_levels CASCADE;
DROP TABLE IF EXISTS cello_piece_sheet_music CASCADE;

CREATE TABLE cello_composers (
composer_id INT PRIMARY KEY,
composer_name VARCHAR(255),
composer_bio TEXT
);

CREATE TABLE users (
user_id SERIAL,
username varchar(50) NOT NULL UNIQUE,
password_hash varchar(200) NOT NULL,
role varchar(50) NOT NULL,
CONSTRAINT PK_user PRIMARY KEY (user_id)
);

-- CREATE TABLE suzuki_book_levels (
-- suzuki_book_level_id INT PRIMARY KEY,
-- suzuki_book_level VARCHAR(255)
-- );

CREATE TABLE cello_pieces (
piece_id INT PRIMARY KEY,
piece_name VARCHAR(255),
composer_id INT,
suzuki_book_level_id INT,
isArrangement boolean,
FOREIGN KEY (composer_id) REFERENCES cello_composers(composer_id)
-- FOREIGN KEY (suzuki_book_level_id) REFERENCES suzuki_book_levels(suzuki_book_level_id)
);

CREATE TABLE cello_piece_audio (
audio_id INT PRIMARY KEY,
piece_id INT,
audio_url VARCHAR(255),
FOREIGN KEY (piece_id) REFERENCES cello_pieces(piece_id)
);

INSERT INTO cello_composers (composer_id, composer_name, composer_bio) VALUES
(1, 'Florence Beatrice Price', 'Florence Beatrice Price (1887-1953) was an African-American composer, arranger, and organist who was the first black woman to have a symphonic composition performed by a major American orchestra.'),
(2, 'William Grant Still', 'William Grant Still (1895-1978) was an African-American composer known for his fusion of classical and popular music styles. He was the first black composer to conduct a symphony orchestra in the United States.'),
(3, 'Samuel Coleridge-Taylor', 'Samuel Coleridge-Taylor (1875-1912) was an Afro-British composer who gained international fame for his choral work, "Hiawatha''s Wedding Feast." He was a pioneer in incorporating African elements into Western classical music.'),
(4, 'Rebecca Clarke', 'Rebecca Clarke (1886-1979) was an English composer and violist who was one of the first female professional orchestral players in England. She is known for her chamber music and solo works for viola and cello.'),
(5, 'David Baker', 'David Baker (1931-2016) was an African-American composer, educator, and jazz musician. He was a leading figure in jazz education and helped to establish jazz studies programs at several universities.'),
(6, 'George Walker', 'George Walker (1922-2018) was an African-American composer and pianist who was the first black composer to win the Pulitzer Prize for Music. He was also a pioneer in electronic music.'),
(7, 'Errollyn Wallen', 'Errollyn Wallen (b. 1958) is a British composer, pianist, and singer who has written works for a variety of genres, including opera, chamber music, and film scores. She was the first black woman to have a work performed at the Proms.'),
(8, 'Ethel Smyth', 'Dame Ethel Smyth (1858-1944) was an English composer, writer, and suffragette. She is known for her operas, which were popular in the early 20th century, as well as her contributions to the women''s suffrage movement in England.'),
(9, 'Undine Smith Moore', 'Undine Smith Moore (1904-1989) was an African-American composer and educator who was a leading figure in the development of African-American art music. She was the first black woman to receive a doctorate in music from the Eastman School of Music.'),
(10, 'Margaret Bonds', 'Margaret Bonds (1913-1972) was an African-American composer and pianist who collaborated with Langston Hughes on several works, including the opera "Troubled Island." She was a leading figure in the development of art songs by black composers.'),
(11, 'Jessie Montgomery', 'Jessie Montgomery (b. 1981) is an American composer and violinist who is known for her chamber and orchestral works. She has been commissioned by a variety of organizations, including the New York Philharmonic.'),
(12, 'Margaret Bonds', 'Margaret Bonds (1913-1972) was an African-American composer and pianist who collaborated with Langston Hughes on several works, including the opera "Troubled Island." She was a leading figure in the development of art songs by black composers.'),
(13, 'Amanda Maier', 'Amanda Maier (1853-1894) was a Swedish composer and violinist who studied with the famous Hungarian violinist Joseph Joachim. She is known for her chamber music and art songs, and was one of the first female composers to achieve recognition in Sweden. Despite her musical talent, Maier was discouraged from pursuing a career in music due to societal norms at the time. Her works were largely forgotten until the late 20th century, when renewed interest in women composers brought her music to a wider audience.'),
(14, 'Augusta Holmès', 'Augusta Holmès (1847-1903) was a French composer of Irish descent. She was a prolific composer, known for her orchestral and choral works, and was considered by many to be a leading figure in French music during her lifetime. Despite her success, Holmès faced discrimination and obstacles due to her gender, including being denied admission to the Paris Conservatory. Her music often featured themes of mythology and nature, and she was particularly inspired by Irish folklore and the works of Shakespeare.'),
(15, 'Maud Powell', 'Maud Powell (1867-1920) was an American violinist and composer who played an important role in promoting American music during the late 19th and early 20th centuries. She was one of the first American musicians to achieve international recognition, and was known for her virtuosic playing style and commitment to promoting music by American composers. Powell also composed her own works, which were often inspired by American folk music and landscapes.'),
(16, 'Amy Beach', 'Amy Beach (1867-1944) was an American composer and pianist who was the first American woman to have a symphony performed by a major orchestra. She composed in a variety of genres, including art songs, chamber music, and orchestral works, and was particularly known for her piano music. Beach was a prominent figure in the Boston musical scene and was a member of several musical organizations, but faced criticism and discrimination due to her gender.'),
(17, 'Undine Smith Moore', 'Undine Smith Moore (1904-1989) was an American composer and music educator who was known for her works inspired by African American spirituals and folk music. She was a prominent figure in the Black Arts Movement of the 1960s and 1970s, and was a founder of the Black Music Center at Virginia State University. Moore received numerous awards and honors for her contributions to music, and her works continue to be performed and recorded today.'),
(18, 'Tomeka Reid', 'Tomeka Reid (b. 1977) is an American cellist, composer, and improviser who is known for her unique and innovative approach to the cello. She has collaborated with a wide range of musicians and has been praised for her ability to blend different musical traditions, including jazz, classical, and experimental music. Reid has also been an advocate for underrepresented musicians, and has worked to promote diversity and inclusivity in the music industry.');
 
 
 
 
 
-- INSERT INTO suzuki_book_levels (suzuki_book_level_id, suzuki_book_level) VALUES
-- (1, 'Suzuki Book 1'),
-- (2, 'Suzuki Book 2'),
-- (3, 'Suzuki Book 3'),
-- (4, 'Suzuki Book 4'),
-- (5, 'Suzuki Book 5'),
-- (6, 'Suzuki Book 6'),
-- (7, 'Suzuki Book 7'),
-- (8, 'Suzuki Book 8'),
-- (9, 'Suzuki Book 9'),
-- (10, 'Suzuki Book 10');

INSERT INTO cello_pieces (piece_id, piece_name, composer_id, suzuki_book_level_id, isArrangement) VALUES
(1, 'Three Pieces for Cello and Piano', 1, 9, false),
(2, 'Romance for Cello and Piano', 2, 6, true),
(3, 'Fantasy Pieces for Cello and Piano', 3, 7, true),
(4, 'Meditation for Cello and Piano', 4, 8, false),
(5, 'Suite for Cello and Piano', 5, 4, false),
(6, 'Lament for Cello and Piano', 6, 10, false),
(7, 'Sonata for Cello and Piano', 7, 5, false),
(8, 'Two Pieces for Cello and Piano', 8, 3, false),
(9, 'Impressions for Cello and Piano', 9, 10, false),
(10, 'Sonata for Cello and Piano', 10, 9, false),
(11, 'Quietude', 11, 2, false),
(12, 'Song Without Words', 1, 6, false),
(13, 'Lullaby', 2, 2, false),
(14, 'Berceuse', 13, 1, false),
(15, 'Elegy', 6, 8, false),
(16, 'Little Suite for Cello and Piano', 6, 4, false),
(17, 'Melody', 2, 1, false),
(18, 'Berceuse', 14, 1, false),
(19, 'Cradle Song', 15, 2, false),
(20, 'Romance', 17, 3, false),
(21, 'Scales and Arpeggios for Cello', 1, 7, false),
(22, 'Cello Drones for Tuning and Improvisation', 18, 8, false),
(23, 'Nobody Knows The Trouble Ive Seen', 1, 7, true);


INSERT INTO cello_piece_audio (audio_id, piece_id, audio_url) VALUES
(1, 1, 'https://example.com/piece1.mp3'),
(2, 2, 'https://example.com/piece2.mp3'),
(3, 3, 'https://example.com/piece3.mp3'),
(4, 4, 'https://example.com/piece4.mp3'),
(5, 5, 'https://example.com/piece5.mp3'),
(6, 6, 'https://example.com/piece6.mp3'),
(7, 7, 'https://example.com/piece7.mp3'),
(8, 8, 'https://example.com/piece8.mp3'),
(9, 9, 'https://example.com/piece9.mp3'),
(10, 10, 'https://example.com/piece10.mp3'),
(11, 11, 'https://example.com/piece11.mp3'),
(12, 12, 'https://example.com/piece12.mp3'),
(13, 13, 'https://example.com/piece13.mp3'),
(14, 14, 'https://example.com/piece14.mp3'),
(15, 15, 'https://example.com/piece15.mp3'),
(16, 16, 'https://example.com/piece16.mp3'),
(17, 17, 'https://example.com/piece17.mp3'),
(18, 18, 'https://example.com/piece18.mp3'),
(19, 19, 'https://example.com/piece19.mp3'),
(20, 20, 'https://example.com/piece20.mp3');

CREATE TABLE cello_piece_sheet_music (
sheet_music_id INT PRIMARY KEY,
piece_id INT,
sheet_music_url VARCHAR(255),
FOREIGN KEY (piece_id) REFERENCES cello_pieces(piece_id)
);

INSERT INTO cello_piece_sheet_music (sheet_music_id, piece_id, sheet_music_url) VALUES
(1, 1, 'https://example.com/piece1.pdf'),
(2, 2, 'https://imslp.org/wiki/5_Fantasiest%C3%BCcke,_Op.5_(Coleridge-Taylor,_Samuel)'),
(3, 3, 'https://example.com/piece3.pdf'),
(4, 4, 'https://example.com/piece4.pdf'),
(5, 5, 'https://example.com/piece5.pdf'),
(6, 6, 'https://example.com/piece6.pdf'),
(7, 7, 'https://example.com/piece7.pdf'),
(8, 8, 'https://example.com/piece8.pdf'),
(9, 9, 'https://example.com/piece9.pdf'),
(10, 10, 'https://example.com/piece10.pdf'),
(11, 11, 'https://example.com/piece11.pdf'),
(12, 12, 'https://example.com/piece12.pdf'),
(13, 13, 'https://example.com/piece13.pdf'),
(14, 14, 'https://example.com/piece14.pdf'),
(15, 15, 'https://example.com/piece15.pdf'),
(16, 16, 'https://example.com/piece16.pdf'),
(17, 17, 'https://example.com/piece17.pdf'),
(18, 18, 'https://example.com/piece18.pdf'),
(19, 19, 'https://example.com/piece19.pdf'),
(20, 20, 'https://example.com/piece20.pdf'),
(22, 22, 'https://imslp.org/wiki/Adoration_(Price%2C_Florence)');

COMMIT;