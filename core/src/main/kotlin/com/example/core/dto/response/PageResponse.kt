package com.example.core.dto.response

import org.springframework.data.domain.Page

data class PageResponse<T>(
    val totalPages: Int,
    val currentPage: Int,
    val pageSize: Int,
    val content: List<T>,
) {
    companion object {
        fun <T> from(page: Page<T>): PageResponse<T> =
            PageResponse(
                totalPages = page.totalPages,
                currentPage = page.pageable.pageNumber + 1,
                pageSize = page.pageable.pageSize,
                content = page.content,
            )
    }
}
