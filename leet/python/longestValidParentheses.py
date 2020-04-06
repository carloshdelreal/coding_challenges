# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

class Solution:
    def longestValidParentheses(self, s: str) -> int:
        i = 0
        max_length = 0
        previous = 0
        while(i < len(s)):
            print(f'i: {i}, previous: {previous}')
            validLength = Solution.validSubstrLength(s[i:])
            if validLength == 0:
                i += 1
                previous = 0
            else:
                i += validLength
                if max_length < validLength + previous:
                    max_length = validLength + previous
                previous = validLength + previous
        return max_length
                
        
    @staticmethod
    def validSubstrLength(s: str):
        counter = 0
        stack = []
        for char in s:
            if char == '(':
                stack.append(char)
            elif char == ')':
                if len(stack) == 0:
                    return counter
                stack.pop()
                counter += 2
            if len(stack) == 0:
                    return counter
        if len(stack) == 0:
            return counter
        else:
            return 0