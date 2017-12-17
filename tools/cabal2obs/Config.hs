module Config where

import Config.LTS8
import Config.LTS9
import Types

knownPackageSets :: [PackageSetId]
knownPackageSets = [PackageSetId "lts-8", PackageSetId "lts-9", PackageSetId "nightly"]

getConfig :: PackageSetId -> PackageSetConfig
getConfig (PackageSetId "lts-8")   = lts8
getConfig (PackageSetId "lts-9")   = lts9
getConfig (PackageSetId "nightly") = lts9
getConfig psid                     = error $ "getConfig: unknown package set " ++ show psid

getConfigDirname :: PackageSetId -> String
getConfigDirname (PackageSetId ('l':'t':'s':'-':n)) = 'L':'T':'S':n
getConfigDirname (PackageSetId "nightly")           = "Nightly"
getConfigDirname psid                               = error $ "getConfigDirname: unknown package set " ++ show psid
