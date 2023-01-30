vim9script

def DetermineCaseStyle(word: string): string
  # 大文字を含まない
  if word ==# tolower(word)
    return 'snake'
  # 小文字を含まない
  elseif word ==# toupper(word)
    return 'upper'
  # 1文字目が小文字
  elseif word[0] =~# '[a-z]'
    return 'camel'
  else
    return 'pascal'
  endif
enddef

def SplitToken(word: string): list<string>
  const style = DetermineCaseStyle(word)
  if style ==# 'snake'
    return split(word, '_')
  elseif style ==# 'upper'
    return mapnew(split(word, '_'), (_, t) => tolower(t))
  else
    return mapnew(split(word, '\zs\ze[A-Z]'), (_, t) => tolower(t))
  endif
enddef

export def ToSnakeCase(word: string): string
  const tokens = SplitToken(word)
  return tokens->join('_')
enddef

export def ToUpperCase(word: string): string
  const tokens = SplitToken(word)
  return tokens->mapnew((_, t) => toupper(t))->join('_')
enddef

export def ToPascalCase(word: string): string
  const tokens = SplitToken(word)
  return tokens->mapnew((_, t) => toupper(t[0]) .. t[1 : ])->join('')
enddef

export def ToCamelCase(word: string): string
  const pascal = ToPascalCase(word)
  return tolower(pascal[0]) .. pascal[1 : ]
enddef

export def To(style: string): void
  const word = expand('<cword>')
  const converted = {
    snake: ToSnakeCase,
    upper: ToUpperCase,
    pascal: ToPascalCase,
    camel: ToCamelCase,
  }[style](word)
  setline('.', substitute(getline('.'), word, converted, ''))
enddef
