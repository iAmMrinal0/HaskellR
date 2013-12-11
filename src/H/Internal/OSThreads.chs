-- |
-- Copyright: (C) 2013 Amgen, Inc.
--
-- Needed definitions copied from rts/[posix|win32]/OSThreads.c in ghc source.

{-# LANGUAGE CPP #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module H.Internal.OSThreads
  ( osThreadId
  , OSThreadId
  )
  where

import Foreign.C

#ifdef H_ARCH_UNIX

#include <pthread.h>

type OSThreadId = {#type pthread_t #}

{# fun pthread_self as osThreadId {} -> `OSThreadId' id #}

#else

#include <Windows.h>

type OSThreadId = {#type DWORD #}

{# fun GetCurrentThreadId as osThreadId {} -> `OSThreadId' id #}

#endif