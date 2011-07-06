/*
 * Written by Solar Designer and placed in the public domain.
 * See crypt_blowfish.c for more information.
 */

#ifndef _CRYPT_BLOWFISH_H
#define _CRYPT_BLOWFISH_H

extern char *_crypt_blowfish_rn(const char *key, const char *setting,
	char *output, int size);
extern char *_crypt_gensalt_blowfish_rn(unsigned long count,
	const char *input, int size, char *output, int output_size);

#endif
