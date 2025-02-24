package com.example.core.auth.filter

import com.example.core.auth.AuthTokenProvider
import com.example.core.util.getAccessToken
import jakarta.servlet.FilterChain
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.filter.OncePerRequestFilter

class TokenAuthenticationFilter(
    private val tokenProvider: AuthTokenProvider,
) : OncePerRequestFilter() {
    override fun doFilterInternal(
        request: HttpServletRequest,
        response: HttpServletResponse,
        filterChain: FilterChain,
    ) {
        val tokenStr = request.getAccessToken()

        tokenStr ?: run {
            filterChain.doFilter(request, response)
            return
        }

        val token = tokenProvider.convertAuthToken(tokenStr)

        if (token.isValid) {
            val authentication = tokenProvider.getAuthentication(token)
            SecurityContextHolder.getContext().authentication = authentication
        }

        filterChain.doFilter(request, response)
    }
}
