module Paths_diff (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/cpehle/Development/diff/.stack-work/install/x86_64-osx/lts-3.10/7.10.2/bin"
libdir     = "/Users/cpehle/Development/diff/.stack-work/install/x86_64-osx/lts-3.10/7.10.2/lib/x86_64-osx-ghc-7.10.2/diff-0.1.0.0-GouUhpbFdJK0gFi8Q7d8wG"
datadir    = "/Users/cpehle/Development/diff/.stack-work/install/x86_64-osx/lts-3.10/7.10.2/share/x86_64-osx-ghc-7.10.2/diff-0.1.0.0"
libexecdir = "/Users/cpehle/Development/diff/.stack-work/install/x86_64-osx/lts-3.10/7.10.2/libexec"
sysconfdir = "/Users/cpehle/Development/diff/.stack-work/install/x86_64-osx/lts-3.10/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "diff_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "diff_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "diff_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "diff_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "diff_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
