/*
 * Written by Solar Designer and placed in the public domain.
 * See crypt_blowfish.c for more information.
 */

#ifndef _CRYPT_GENSALT_H
#define _CRYPT_GENSALT_H

extern unsigned char _crypt_itoa64[];
extern char *_crypt_gensalt_traditional_rn(const char *prefix,
	unsigned long count,
	const char *input, int size, char *output, int output_size);
extern char *_crypt_gensalt_extended_rn(const char *prefix,
	unsigned long count,
	const char *input, int size, char *output, int output_size);
extern char *_crypt_gensalt_md5_rn(const char *prefix, unsigned long count,
	const char *input, int size, char *output, int output_size);

#endif
