vim9script

import '../autoload/convertcase.vim'

final suite = themis#suite('convertcase')
const assert = themis#helper('assert')

def TestToSnakeCase(): void
  const tests = [
    {input: ['foo_bar'], want: 'foo_bar'},
    {input: ['FOO_BAR'], want: 'foo_bar'},
    {input: ['fooBar'], want: 'foo_bar'},
    {input: ['FooBar'], want: 'foo_bar'},
  ]

  final child = themis#suite('TestToSnakeCase')
  for tt in tests
    const description = printf('ToSnakeCase(%s)', tt.input)
    child[description] = function((input, want) => {
      const got = call(convertcase.ToSnakeCase, input)
      assert.equals(got, want)
    }, [tt.input, tt.want])
  endfor
enddef
suite.__TestToSnakeCase__ = TestToSnakeCase

def TestToUpperCase(): void
  const tests = [
    {input: ['foo_bar'], want: 'FOO_BAR'},
    {input: ['FOO_BAR'], want: 'FOO_BAR'},
    {input: ['fooBar'], want: 'FOO_BAR'},
    {input: ['FooBar'], want: 'FOO_BAR'},
  ]

  final child = themis#suite('TestToUpperCase')
  for tt in tests
    const description = printf('ToUpperCase(%s)', tt.input)
    child[description] = function((input, want) => {
      const got = call(convertcase.ToUpperCase, input)
      assert.equals(got, want)
    }, [tt.input, tt.want])
  endfor
enddef
suite.__TestToUpperCase__ = TestToUpperCase

def TestToPascalCase(): void
  const tests = [
    {input: ['foo_bar'], want: 'FooBar'},
    {input: ['FOO_BAR'], want: 'FooBar'},
    {input: ['fooBar'], want: 'FooBar'},
    {input: ['FooBar'], want: 'FooBar'},
  ]

  final child = themis#suite('TestToPascalCase')
  for tt in tests
    const description = printf('ToPascalCase(%s)', tt.input)
    child[description] = function((input, want) => {
      const got = call(convertcase.ToPascalCase, input)
      assert.equals(got, want)
    }, [tt.input, tt.want])
  endfor
enddef
suite.__TestToPascalCase__ = TestToPascalCase

def TestToCamelCase(): void
  const tests = [
    {input: ['foo_bar'], want: 'fooBar'},
    {input: ['FOO_BAR'], want: 'fooBar'},
    {input: ['fooBar'], want: 'fooBar'},
    {input: ['FooBar'], want: 'fooBar'},
  ]

  final child = themis#suite('TestToCamelCase')
  for tt in tests
    const description = printf('ToCamelCase(%s)', tt.input)
    child[description] = function((input, want) => {
      const got = call(convertcase.ToCamelCase, input)
      assert.equals(got, want)
    }, [tt.input, tt.want])
  endfor
enddef
suite.__TestToCamelCase__ = TestToCamelCase
