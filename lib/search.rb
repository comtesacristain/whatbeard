LIBRARY_PATH = "/Volumes/media/music/all"
BACKUP_PATH = "/Volumes/media/music/backup"
DOWNLOAD_PATH = "/Volumes/media/music/staging"

library = LibraryOrganiser.new(LIBRARY_PATH,:library)
library.search

backup = LibraryOrganiser.new(BACKUP_PATH,:backup)
backup.search

downloads = LibraryOrganiser.new(DOWNLOAD_PATH,:download)
downloads.search
